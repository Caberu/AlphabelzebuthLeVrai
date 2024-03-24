extends Node2D

@export var demon_scene : PackedScene

var open := false
var selected := false

@export var portal_on : Texture2D
@export var portal_off : Texture2D

@onready var word : Word = get_tree().get_first_node_in_group("Word")


func _ready():
	
	word.on_update_correctness.connect(on_update_correctness)
	on_update_correctness()

func on_update_correctness():
	open = word.correct
	update_open()

func update_open():
	$Sprite2D.texture = portal_on if (open and selected)  else portal_off

func _on_return_key_pressed():
	if (open and selected):
		instantiate_demon(demon_scene)

func _on_click():
	var portals = get_tree().get_nodes_in_group("Portal")
	for p in portals:
		p.selected = false
		p.update_open()
	selected = true
	update_open()

var time := 0.0

func _process(delta):
	if (Input.is_action_just_pressed("CallName")):
		_on_return_key_pressed()
	
	time += delta
	if (open):
		$Sprite2D.modulate = Color($Sprite2D.modulate, sin(time*5)/3+0.66)
	elif (!open):
		$Sprite2D.modulate = Color($Sprite2D.modulate, 0.4)

func instantiate_demon(scene : PackedScene):
	var instance : Node2D = scene.instantiate()
	var demon_name = word.word.reverse().to_lower()
	demon_name = demon_name.capitalize()
	word.set_unavailable_name(demon_name)
	instance.get_node("DemonCreator").initialize(demon_name)
	word.use_name(demon_name)
	$"../Demons".add_child(instance)
	instance.global_position = global_position
	

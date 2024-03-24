extends Node2D

@export var demon_scene : PackedScene

var open := false
var selected := false

@onready var word : Word = get_tree().get_first_node_in_group("Word")

var cd := -1.0


func _ready():
	
	word.on_update_correctness.connect(on_update_correctness)
	on_update_correctness()

func on_update_correctness():
	open = word.correct
	update_open()

func update_open():
	if (time < cd):
		return
	$AnimationPlayer.play("Portail_open" if (open and selected)  else "Portail_close")

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
	
	if (time > cd and cd != -1):
		cd = -1
		update_open()
	
	time += delta
	if (selected):
		$Sprite2D.modulate = Color($Sprite2D.modulate, sin(time*5)/3+0.66)
	elif (!selected):
		$Sprite2D.modulate = Color($Sprite2D.modulate, 0.7)

func instantiate_demon(scene : PackedScene):
	var instance : Node2D = scene.instantiate()
	var demon_name = word.word.reverse().to_lower()
	demon_name = demon_name.capitalize()
	word.set_unavailable_name(demon_name)
	instance.get_node("DemonCreator").initialize(demon_name)
	word.use_name(demon_name)
	$"../Demons".add_child(instance)
	instance.global_position = global_position
	instance.global_position.y += 17
	cd = time + 0.5
	$AnimationPlayer.play("Portail_burst")
	$Sprite2D.modulate = Color($Sprite2D.modulate, 1)

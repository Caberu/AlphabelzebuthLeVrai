extends Node2D

@export var demon_scene : PackedScene

var open := false
@export var selected := false
@export var idx : int

@onready var word : Word = get_tree().get_first_node_in_group("Word")

var cd := -1.0

var just_changed_portal := false

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
	just_changed_portal = true
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
	
	if (selected and not just_changed_portal):
		if (Input.is_action_just_pressed("ui_up")):
			change_portal(-1)
			
		elif (Input.is_action_just_pressed("ui_down")):
			change_portal(1)
	just_changed_portal = false
	
	if (time > cd and cd != -1):
		cd = -1
		update_open()
	
	time += delta
	if (selected):
		$Sprite2D.modulate = Color(Color.WHITE, sin(time*5)/3+0.75)
	elif (!selected):
		$Sprite2D.modulate = Color(Color.GRAY, 0.3)


func change_portal(dir : int):
	var game : Game = get_tree().get_first_node_in_group("Game")
	game.lines[(idx+dir+game.lines.size())%game.lines.size()].get_node("Portal")._on_click()

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

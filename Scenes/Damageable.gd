class_name Damageable extends Node2D

@export var max_hp : int

var health_bar : HealthBar = null
var hp : int

signal death
signal on_dmg

func _ready():
	hp = max_hp
	
	for child in $"../".get_children():
		if child is HealthBar:
			health_bar = child
			health_bar.max_val = max_hp
			break


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health_bar != null: health_bar.update_val(hp)
	if hp <= 0: death.emit()
	
func damage(dmg: int):
	hp = max(0, hp - dmg)
	on_dmg.emit()
	
func set_hp(val: int):
	hp = val
	

extends Node2D

var lettre : String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if (lettre.is_empty() && $".." is Letter):
		lettre = $"..".letter
	set_gfx(lettre)
	
func set_gfx(lettre : String):
	self.lettre = lettre
	$Sprite2D.texture =  load("res://Sprites/lettre/"+lettre.to_lower()+".png")

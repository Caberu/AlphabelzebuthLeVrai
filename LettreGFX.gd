extends Node2D

var lettre : String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	if (lettre.is_empty()):
		lettre = $"..".letter
	$Sprite2D.texture =  load("res://Sprites/lettre/"+lettre.to_lower()+".png")

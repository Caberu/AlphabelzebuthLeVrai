extends Attacker

var dmg : int = 1

func get_closest(nodes : Array[Node]) -> Node2D:
	var closest : Node = null
	var min_dist : float = 99999999.0
	for node : Node in nodes:
		if get_distance(node) <= min_dist:
			closest = node
	
	return closest


func get_enemy() -> Node2D:
	var enemy : Node2D = get_closest($"../../../".get_tree().get_nodes_in_group(enemy_group))
	
	if enemy != null && get_distance(enemy) <= radius:
		return enemy
	
	return null
	
func attack(enemy : Node2D):
	var damageable : Damageable = enemy.find_child("Damageable")
	damageable.damage(dmg)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

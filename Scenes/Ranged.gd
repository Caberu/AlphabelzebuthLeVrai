class_name Ranged extends Attacker

@onready var walk : Walk = $"../Walk"
@onready var projectile : PackedScene = load("res://Scenes/Bullet.tscn")


func get_closest(nodes : Array[Node]) -> Node2D:
	var closest : Node = null
	var min_dist : float = 99999999.0
	for node : Node in nodes:
		if abs(node.global_position.y - global_position.y) > 20: continue
		var dist := get_distance(node)
		if dist <= min_dist:
			closest = node
			min_dist = dist
	
	return closest


func get_enemy() -> Node2D:
	var enemy : Node2D = get_closest($"../../../".get_tree().get_nodes_in_group(enemy_group))
	
	if enemy != null && get_distance(enemy) <= radius:
		return enemy
	
	return null
	
func attack(enemy : Node2D):
	var damageable : Damageable = enemy.find_child("Damageable")
	var bullet : Bullet = projectile.instantiate()
	bullet.target = enemy
	bullet.dmg = dmg
	$"../../".add_child(bullet)
	bullet.global_position = global_position

func initiate_attack():
	var enemy : Node2D = get_enemy()
	
	if enemy != null:
		walk.toggle_move(false)
		cooldown_stop = Time.get_ticks_msec()+cooldown*1000
		attack(enemy)
	else:
		walk.toggle_move(true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Time.get_ticks_msec() > cooldown_stop:
		initiate_attack()

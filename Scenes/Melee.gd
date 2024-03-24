class_name Melee extends Attacker

@onready var walk : Walk = $"../Walk"

var dmg : int = 1

func get_closest(nodes : Array[Node]) -> Node2D:
	var closest : Node = null
	var min_dist : float = 99999999.0
	for node : Node in nodes:
		if abs(node.global_position.y - global_position.y) > 10: continue
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
	# Joue une animation
	damageable.damage(dmg)

func initiate_attack():
	var enemy : Node2D = get_enemy()
	
	if enemy != null:
		#print("%s : %s" % [$"../".get_path().get_concatenated_names(), enemy.get_path().get_concatenated_names()])
		walk.toggle_move(false)
		cooldown_stop = Time.get_ticks_msec()+cooldown
		attack(enemy)
	else:
		walk.toggle_move(true)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Time.get_ticks_msec() > cooldown_stop:
		initiate_attack()

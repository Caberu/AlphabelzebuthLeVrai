extends Camera2D
class_name Camera2DPlus #prcq il y a du screen shake

@export var noiseTex : Noise

@onready var center := position
var shakeRemainingTime := 0.0
var time := 0.0
var shakeAmp := 0.0
var shakeFreq := 0.0

@export var BASE_ZOOM := Vector2(4,4)
var zoom_ratio := 1.0

@export var prefab_path_for_reset : String

@export var infiniteShake := false
@export var overlay : Node2D
@export var fade : Node2D
@export var dialogueBox : Control
@export var debugText : Control

func _process(delta):
	shakeRemainingTime -= delta
	if (shakeRemainingTime < 0 && !infiniteShake):
		shakeAmp = 0
	time += delta
	update_cam()

func set_cam_position(pos : Vector2):
	center = pos
	update_cam()

func update_cam():
	var noise := Vector2(noiseTex.get_noise_1d(time*shakeFreq), noiseTex.get_noise_1d(time*shakeFreq+20050.3))
	var rotationaleNoise := noiseTex.get_noise_1d(time*shakeFreq*3)
	rotation = shakeAmp/180*rotationaleNoise
	position = center + shakeAmp*noise

	force_update_scroll()

func shake(length : float, amp : float, freq : float, infinite := false):
	shakeRemainingTime = length
	shakeAmp = amp
	shakeFreq = freq
	infiniteShake = infinite

func SetZoom(ratio : float):
	zoom_ratio = ratio
	zoom = (BASE_ZOOM*ratio)
#	dialogueBox.scale = Vector2.ONE/ratio
#	print($DialogBox.scale)
	
func reset():
	#Pour quand on reload
	var new_cam = load(prefab_path_for_reset).instantiate()
	new_cam.name = name

	get_parent().add_child(new_cam,true)
	new_cam.position = Vector2.ZERO
	get_parent().remove_child(self)
	self.queue_free()
	return new_cam

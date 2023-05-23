extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()
var anim_length: float
var anim_position: float
var hasHit = false

func init() -> void:
	hasHit = false
	master.input.x = 0
	master.input.z = 0
	master.isIdle = false
	master.isWalking = false
	master.isRunning = false
	master.isBlocking = false

func process(_move, _look, _delta):
	anim_length = master.PlayerAnimation.current_animation_length
	anim_position = master.PlayerAnimation.current_animation_position
	if anim_position >= anim_length:
		master.isIdle = true
		if Input.is_action_pressed("L1"):
			master.isBlocking = true
	elif !hasHit && floor(anim_position*10) == floor(anim_length*10/2):
		master.add_child( load("res://Player/hitbox.tscn").instantiate())
		hasHit = true

func check_state():
	if master.isBlocking:
		master.isIdle = false
		master.isAttacking = false
		return controller.States.BLOCK
	if master.isIdle:
		master.isAttacking = false
		return controller.States.IDLE
	return controller.States.NULL

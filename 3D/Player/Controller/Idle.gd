extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()

func init() -> void:
	print("IDLE")
	pass

func process(move, _look, _delta):
	master.input.x = -1*master.velocity.x
	master.input.z = -1*master.velocity.z
	if move:
		master.isWalking = true

func check_state():
	if master.isBlocking:
		master.isIdle = false
		return controller.States.BLOCK
	if master.isAttacking:
		master.isIdle = false
		return controller.States.ATTACK
	if master.isWalking:
		master.isIdle = false
		return controller.States.WALK
	if master.isJumping:
		master.isIdle = false
		return controller.States.JUMP
	return controller.States.NULL

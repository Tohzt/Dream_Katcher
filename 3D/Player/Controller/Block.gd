extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()

func init() -> void:
	print("Blocking")
	pass

func process(_move, _look, _delta):
	master.input.x = -1*master.velocity.x
	master.input.z = -1*master.velocity.z

func check_state():
	if master.isIdle:
		master.isBlocking = false
		return controller.States.IDLE
	if master.isAttacking:
		master.isBlocking = false
		return controller.States.ATTACK
	return controller.States.NULL

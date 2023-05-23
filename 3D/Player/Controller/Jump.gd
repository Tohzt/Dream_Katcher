extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()

func init() -> void:
	master.input.y = master.input_jump

func process(move, _look, _delta):
	master.jump_dir = move
	master.isFalling = true


func check_state():
	if master.isFalling:
		master.isJumping = false
		return controller.States.FALL
	return controller.States.NULL

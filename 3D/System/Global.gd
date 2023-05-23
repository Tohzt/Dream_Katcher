extends Node

const GRAVITY = -2
const TERMINAL = -100
#const FALL_ACC = 2.5

@onready var Camera = get_tree().get_nodes_in_group("Camera")[0]
var Camera_Direction = Vector2.ZERO


"""
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
"""

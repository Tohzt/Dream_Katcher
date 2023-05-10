extends player_state
var pointer: Node2D
var tar_position: Vector2

func init(_master, _states, _current, _new_state):
	.init(_master, _states, _current, _new_state)
	tar_position = Global.Player.pos_ortho
	pointer = load("res://System/Pointer/Pointer.tscn").instance()
	self.add_child(pointer)

func process(move, look, _delta):
	if move:
		tar_position += move*2
	if look:
		master.target_dir = look

	pointer.pos_ortho = tar_position
	pointer.z_index = int(pointer.position.y)+20

func check_state() -> int:
	if Input.is_action_just_released("ui_ability_l2"):
		Global.Companion.target_pos = pointer.pos_ortho
		for child in get_children():
			child.queue_free()
		return states.IDLE
	return states.NULL


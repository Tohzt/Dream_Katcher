extends player_state
onready var pointer: Node2D = load("res://System/Pointer/Pointer.tscn").instance()
var tar_position: Vector2

func init(_master, _states, _current, _new_state):
	.init(_master, _states, _current, _new_state)
	tar_position = Global.Player.position
	self.add_child(pointer)

func process(move, look, _delta):
	if Render.renderIso:
		move = move.rotated(deg2rad(45))
	pointer.position = tar_position.floor()
	pointer.z_index = pointer.position.y+20
	if move:
		tar_position += move
		print(pointer.position, " : ", pointer.z_index)
	if look:
		master.target_dir = look

func check_state() -> int:
	return states.NULL


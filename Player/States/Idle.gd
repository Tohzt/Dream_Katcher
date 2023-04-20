extends BaseState

func process(move, look, _delta):
	if move:
		is_moving = true
	else:
		if look != Vector2.ZERO:
			Player.target_dir = look
		is_moving = false

func check_state() -> int:
	if is_moving:
		return STATES_enum.walk
	return STATES_enum.Null


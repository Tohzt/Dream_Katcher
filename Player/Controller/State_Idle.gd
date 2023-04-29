extends STATE

func process(move, look, _delta):
	if move:
		is_moving = true
	else:
		is_moving = false
		if look:
			master.target_dir = look
	detect_roll(move, look)

func check_state() -> int:
	if is_moving:
		is_moving = false
		return states.WALK
	if is_dodging:
		is_dodging = false
		return states.DODGE
	return states.NULL


extends player_state

func process(move, look, delta):
	is_moving = false
	if move:
		is_moving = true
		master.velocity = move
		master.target_dir = master.velocity
	if look:
		master.target_dir = look
	speed_adjust(move, look)
	collision_check(master.velocity*delta*master.speed)
	detect_roll(move, look)

func check_state() -> int:
	if !is_moving:
		return states.IDLE
	if is_dodging:
		is_dodging = false
		return states.DODGE
	return states.NULL


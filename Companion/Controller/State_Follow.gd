extends companion_state

func process(delta):
	master.target_dir = (master.target_pos - master.pos_ortho).normalized()
	master.velocity = master.target_dir

	#detect_roll(move)
	collision_check(master.velocity*delta*master.speed)

func check_state() -> int:
	if master.pos_ortho.distance_to(master.target_pos) <= master.target_dist:
		return states.IDLE
	return states.NULL


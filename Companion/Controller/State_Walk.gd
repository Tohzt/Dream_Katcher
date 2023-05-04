extends companion_state

func process(delta):
	is_moving = false
	#speed_adjust(move, _look)
	collision_check(master.velocity*delta*master.speed)

func check_state() -> int:
	if !is_moving:
		return states.IDLE
	return states.NULL


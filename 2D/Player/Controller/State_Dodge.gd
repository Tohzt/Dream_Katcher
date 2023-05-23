extends player_state

func process(_move, _look, delta):
	collision_check(doj_direction*delta*master.speed)
	is_dodging = true
	dodging -= 1
	if dodging <= 0:
		is_dodging = false

func check_state() -> int:
	if !is_dodging:
		return states.IDLE
	return states.NULL


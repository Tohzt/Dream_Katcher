extends companion_state

func process(_delta):
	if master.pos_ortho.distance_to(master.target_pos) > 50:
		is_following = true

func check_state() -> int:
	if is_following:
		is_following = false
		return states.FOLLOW
	return states.NULL


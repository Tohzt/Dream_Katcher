extends companion_state

func process(_delta):
	master.target_pos = master.position
	if master.position.distance_to(Global.Player.position) > 100:
		is_following = true

func check_state() -> int:
	if is_following:
		is_following = false
		return states.FOLLOW
	return states.NULL


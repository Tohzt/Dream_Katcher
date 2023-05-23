extends projectile_state

func process(_delta):
	print("Stuck")
	pass

func check_state() -> int:
	return states.NULL


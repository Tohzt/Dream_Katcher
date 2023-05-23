extends projectile_state

func process(_delta):
	print("Break")
	master.queue_free()

func check_state() -> int:
	return states.NULL

extends STATE

func process(_move, look, _delta):
	knockback_duration -= 1
	if !knockback:
		knockback = look * -5
	collision_check(knockback)

func check_state() -> int:
	if knockback_duration <= 0:
		master.heal -= master.take_damage
		master.take_damage = 0
		return states.IDLE
	return states.NULL


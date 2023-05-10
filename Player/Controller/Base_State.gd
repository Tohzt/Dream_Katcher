class_name player_state
extends base_state


func init(_master, States, _current, _new_state):
	.init(_master, States, _current, _new_state)
	match _new_state:
		States.IDLE: 
			master.anim_sprite.animation = "Idle"
			master.anim_loop = true
			master.anim_len = 2
			master.anim_dur = 30
		States.WALK: 
			master.anim_sprite.animation = "Walk"
			master.anim_loop = true
			master.anim_len = 2
			master.anim_dur = 10
		States.DODGE:
			master.anim_sprite.animation = "Dodge"
			master.anim_loop = true
			master.anim_len = 1
			master.anim_dur = 30
		States.HURT:
			master.anim_sprite.animation = "Hurt"
			master.anim_loop = true
			master.anim_len = 2
			master.anim_dur = 4
		States.ABILITY:
			master.anim_sprite.animation = "Idle"
			master.anim_loop = false
			master.anim_len = 2
			master.anim_dur = 30
		States.ATTACK:
			master.anim_sprite.animation = "Attack"
			master.anim_loop = true
			master.anim_len = 4
			master.anim_dur = 10

func detect_roll(move, look):
	if look:
		if doj_direction == Vector2.ZERO:
			doj_direction = look
		doj_timer += 1
	else:
		if doj_timer in range(1,doj_trigger):
			master.velocity = doj_direction
			if move:
				speed_adjust(move, doj_direction)
			else:
				master.speed = speed_min
			master.speed = master.speed + speed_doj
			is_dodging = true
		doj_direction = Vector2.ZERO
		doj_timer = 0

	






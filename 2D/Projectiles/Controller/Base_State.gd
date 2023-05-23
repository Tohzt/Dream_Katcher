class_name projectile_state
extends base_state

var is_following = false

func init(_master, States, _current, _new_state):
	.init(_master, States, _current, _new_state)
	match _new_state:
		States.KNOCK: 
			#master.anim_sprite.animation = "Idle"
			master.anim_loop = false
			master.anim_len = 4
			master.anim_dur = 5
		States.FLY: 
			#master.anim_sprite.animation = "Walk"
			master.anim_loop = true
			master.anim_len = 4
			master.anim_dur = 10
		States.STUCK: 
			#master.anim_sprite.animation = "Walk"
			master.anim_loop = false
			master.anim_len = 4
			master.anim_dur = 10
		States.BREAK: 
			#master.anim_sprite.animation = "Walk"
			master.anim_loop = false
			master.anim_len = 4
			master.anim_dur = 10



	

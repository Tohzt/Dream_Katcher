extends player_state

func process(move, look, _delta):
	if Input.is_action_just_released("ui_attack_r2"):
		var arrow_instance = arrow.instance()
		arrow_instance.position = master.position
		if look:
			move = look
		if move:
			master.target_dir = move
		var arrow_direction = master.target_dir
		if Render.renderIso:
			arrow_direction = arrow_direction.rotated(deg2rad(45))
		arrow_instance.direction = arrow_direction
		arrow_instance.rotation = arrow_direction.angle()
		Global.Root.add_child(arrow_instance)
		master.anim_play = true

func check_state() -> int:
	return states.NULL


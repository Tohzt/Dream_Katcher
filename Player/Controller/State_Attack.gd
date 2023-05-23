extends player_state

func process(move, look, _delta):
	if look:
		move = look
	if !move:
		move = master.target_dir

	if Input.is_action_just_released("ui_attack_r2"):
		var arrow_instance = arrow.instance()
		arrow_instance.pos_ortho = Vector2(master.pos_ortho.x, master.pos_ortho.y)
		arrow_instance.target_dir = move

		Global.Root.add_child(arrow_instance)
		master.anim_play = true

func check_state() -> int:
	if master.anim_play:
		return states.IDLE
	return states.NULL


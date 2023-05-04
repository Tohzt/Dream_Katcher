extends base_animation

func process(move, look):
	if anim_cd_dur != master.anim_dur:
		anim_cd_dur = master.anim_dur
		anim_cd = 0

	if master.anim_sprite.animation == "Dodge":
		master.anim_sprite.frame += 1
		if master.anim_sprite.frame >= master.anim_sprite.frames.get_frame_count("Dodge")-1:
			master.anim_sprite.frame = 0
		return

	if look:
		move = look
	if move:
		update_spriteDirection(move)

	anim_cd-=1
	if anim_cd <= 0:
		anim_cd = anim_cd_dur
		anim_updateFrame()

func update_spriteDirection(dir) -> void:
	.update_spriteDirection(dir)
	anim_point = (anim_dir + 30) / 45
	
	match (anim_point % 8):
		0: # Left
			frame_offset = 6 * anim_len #12
		1: # Up-Left
			frame_offset = 5 * anim_len #10
		2: # Up
			frame_offset = 4 * anim_len #8
		3: # Up-Right
			frame_offset = 3 * anim_len #6
		4: # Right
			frame_offset = 2 * anim_len #4
		5: # Down-Right
			frame_offset = 1 * anim_len #2
		6: # Down
			frame_offset = 0
		7: # Down-Left
			frame_offset = 7 * anim_len #14
	
	master.anim_sprite.frame = anim_frame + frame_offset


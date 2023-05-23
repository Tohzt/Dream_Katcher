extends base_animation

func process(move):
	if anim_cd_dur != master.anim_dur:
		anim_cd_dur = master.anim_dur
		anim_cd = 0
	anim_cd-=1
	if anim_cd <= 0:
		anim_cd = anim_cd_dur
		anim_updateFrame()
	if move:
		update_spriteDirection(move)

func update_spriteDirection(dir) -> void:
	.update_spriteDirection(dir)
	anim_point = (anim_dir + 30) / 90
	
	match (anim_point % 4):
		0: frame_offset = 3 * anim_len
		1: frame_offset = 2 * anim_len
		2: frame_offset = 1 * anim_len
		3: frame_offset = 0
	
	master.anim_sprite.frame = anim_frame + frame_offset


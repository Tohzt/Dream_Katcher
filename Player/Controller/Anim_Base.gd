class_name ANIMATION
extends Node

var master: Node2D

var anim_dir = 0
var anim_len = 2
var anim_loop = true
var anim_frame = 0
var anim_cd_dur = 30
var anim_cd = anim_cd_dur
var anim_point : int
var frame_offset : int

func anim_updateFrame() -> void:
	anim_frame = (anim_frame+1) % anim_len
	master.anim_sprite.frame = anim_frame + frame_offset

func init(_master) -> void:
	master = _master
	anim_frame = 0
	anim_loop = master.anim_loop
	anim_len = master.anim_len
	anim_cd_dur = master.anim_dur
	anim_cd = 0
	anim_updateFrame()

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
	if Render.renderIso:
		dir = dir.rotated(deg2rad(45))
	anim_dir = int(180 + rad2deg(dir.angle()))
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


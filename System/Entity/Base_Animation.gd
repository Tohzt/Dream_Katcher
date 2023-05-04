class_name base_animation
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

func init(_master) -> void:
	master = _master
	anim_frame = 0
	anim_loop = master.anim_loop
	anim_len = master.anim_len
	anim_cd_dur = master.anim_dur
	anim_cd = 0
	anim_updateFrame()

func anim_updateFrame() -> void:
	var next_frame = (anim_frame+1) % anim_len
	if anim_loop || next_frame > anim_frame:
		anim_frame = next_frame
	master.anim_sprite.frame = anim_frame + frame_offset

func update_spriteDirection(dir) -> void:
	if Render.renderIso:
		dir = dir.rotated(deg2rad(45))
	anim_dir = int(180 + rad2deg(dir.angle()))
	


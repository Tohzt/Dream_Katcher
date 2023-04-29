class_name STATE
extends Node

var master: Node2D
var current
var states


var friction = 2.5
var speed_min = 100
var speed_def = 200
var speed_max = 300
var speed_doj = 200

var is_moving = false
var is_dodging = false

var doj_timer = 0
var doj_trigger = 5
var doj_direction = Vector2.ZERO
var doj_dur = 20
var dodging = doj_dur

func init(_master, _states, _current, _new_state):
	master = _master
	doj_direction = master.velocity
	dodging = doj_dur
	current = _current
	states = _states
	match _new_state:
		1: 
			master.anim_sprite.animation = "Idle"
			master.anim_loop = true
			master.anim_len = 2
			master.anim_dur = 30
		2: 
			master.anim_sprite.animation = "Walk"
			master.anim_loop = true
			master.anim_len = 2
			master.anim_dur = 10
		3:
			master.anim_sprite.animation = "Dodge"
			master.anim_loop = true
			master.anim_len = 1
			master.anim_dur = 30

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

func speed_adjust(move, look):
	if not is_dodging:
		if look:
			var angle = abs(rad2deg(move.angle_to(look)))
			if angle < 45:
				master.speed = speed_max
				master.anim_dur = 5
			elif angle > 90:
				master.speed = speed_min
				master.anim_dur = 20
		else:
			master.speed = speed_def
			master.anim_dur = 10

func collision_check(pos, rec = false):
	var can_move = true
	var next_pos = master.pos_ortho + pos
	var next_grid_pos = Vector2(floor(next_pos.x / Global.Cell.x), floor(next_pos.y / Global.Cell.y))
	var next_grid_type = Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x]
	var next_elevation = Global.Tileheight[next_grid_pos.x + next_grid_pos.y * Global.Grid.x]

	if next_grid_type > 0 && elevation_check(next_elevation):
		master.pos_ortho = next_pos
		master.elevation = next_elevation
	elif !rec:
		collision_check(Vector2(0, pos.y), true)
		collision_check(Vector2(pos.x, 0), true)

func elevation_check(ele) -> bool:
	if master.elevation + master.elevation_climb >= ele:
		return true
	return false

	





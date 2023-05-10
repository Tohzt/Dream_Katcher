class_name base_state
extends Node

var arrow = preload("res://Projectiles/Arrow.tscn")
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

var knockback: Vector2 = Vector2.ZERO
var knockback_duration = 10

var doj_timer = 0
var doj_trigger = 5
var doj_direction = Vector2.ZERO
var doj_dur = 20
var dodging = doj_dur

func init(_master, _states, _current, _new_state):
	master = _master
	doj_direction = master.velocity
	dodging = doj_dur
	knockback = master.velocity.normalized() * -5
	knockback_duration = knockback.length()
	current = _current
	states = _states

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
	var buffer = Vector2(sign(pos.x) * 10, sign(pos.y) * 10)
	var next_pos = master.pos_ortho + pos
	var next_grid_pos = Vector2(floor((next_pos.x + buffer.x) / Global.Cell.x), floor((next_pos.y + buffer.y) / Global.Cell.y))
	var next_grid_type = Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x]
	var next_elevation = Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x] - floor(Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x])

	# Take Damage From Spikes
	if floor(next_grid_type) == 5 && master.anim_sprite.animation != "Dodge":
		master.State.change_state(states.HURT)
		master.take_damage = 10
		return

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

	






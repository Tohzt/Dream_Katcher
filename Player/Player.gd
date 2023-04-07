extends Node2D

var elevation: float = 0.1
var elevation_climb: float = 0.1
var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var grid_pos = Vector2.ZERO
var pos_iso: Vector2 = Vector2.ZERO
var pos_ortho: Vector2 = Vector2(100,100)

func _ready():
	pass

func _input(_event):
	#if event is InputEventKey:
		#if event.is_pressed():
			var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
			velocity = input_direction.normalized()

func collision_check(pos):
	var next_pos = pos_ortho + pos
	var _grid_pos = Vector2.ZERO
	_grid_pos.x = floor(next_pos.x / Global.cell.x)
	_grid_pos.y = floor(next_pos.y / Global.cell.y)
	# Perimeter Limit
	if _grid_pos.x >= 0 && _grid_pos.x < Global.grid.x && _grid_pos.y >= 0 && _grid_pos.y < Global.grid.y:
		var next_elevation = Global.tileheight[_grid_pos.x + _grid_pos.y * Global.grid.x]
		# Height Check
		if elevation + elevation_climb >= next_elevation:
			elevation = next_elevation
			pos_ortho += pos


func _physics_process(delta):
	grid_pos.x = floor(pos_ortho.x / Global.cell.x)
	grid_pos.y = floor(pos_ortho.y / Global.cell.y)
	collision_check(velocity*delta*speed)
	if Render.renderIso:
		pos_iso = Render.get_iso(pos_ortho)
		position = pos_iso - Vector2(0,elevation*Global.cell.y)
		z_index = Render.get_z_index(grid_pos.x, grid_pos.y)+1
	else:
		position = pos_ortho
		z_index = 1


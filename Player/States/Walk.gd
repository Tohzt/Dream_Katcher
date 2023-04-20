extends BaseState

func collision_check(pos):
	var next_pos = Player.pos_ortho + pos
	var _grid_pos = Vector2.ZERO
	_grid_pos.x = floor(next_pos.x / Global.Cell.x)
	_grid_pos.y = floor(next_pos.y / Global.Cell.y)
	# Perimeter Limit
	if _grid_pos.x >= 0 && _grid_pos.x < Global.Grid.x && _grid_pos.y >= 0 && _grid_pos.y < Global.Grid.y:
		var next_elevation = Global.Tileheight[_grid_pos.x + _grid_pos.y * Global.Grid.x]
		# Height Check
		if Player.elevation + Player.elevation_climb >= next_elevation:
			Player.elevation = next_elevation
			Player.pos_ortho += pos

func process(move, look, delta):
	is_moving = false
	if move:
		is_moving = true
		Player.velocity = move
		Player.target_dir = Player.velocity
	if look:
		Player.target_dir = look

	collision_check(Player.velocity*delta*speed)

func check_state() -> int:
	if !is_moving:
		return STATES_enum.idle
	return STATES_enum.Null

func exit() -> void:
	is_moving = false


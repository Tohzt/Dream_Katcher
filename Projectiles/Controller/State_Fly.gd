extends projectile_state

var arrow_break = false

func process(delta):
	print("Fly")
	collision_check(master.target_dir*delta*master.speed)

func check_state() -> int:
	if arrow_break:
		return states.BREAK
	return states.NULL

func collision_check(pos):
	var buffer = Vector2(sign(pos.x) * 10, sign(pos.y) * 10)
	var next_pos = master.pos_ortho + pos
	var next_grid_pos = Vector2(floor((next_pos.x + buffer.x) / Global.Cell.x), floor((next_pos.y + buffer.y) / Global.Cell.y))
	var next_grid_type = Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x]
	var next_elevation = Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x] - floor(Global.Tilemap[next_grid_pos.x + next_grid_pos.y * Global.Grid.x])

	if next_grid_type > 0 && elevation_check(next_elevation):
		master.pos_ortho = next_pos
		master.elevation = next_elevation
	else:
		arrow_break = true

func elevation_check(ele) -> bool:
	if master.elevation + master.elevation_climb >= ele:
		return true
	return false

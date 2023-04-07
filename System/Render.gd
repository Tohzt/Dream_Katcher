extends Node
var tiles = []
var renderIso: bool = true
var environment = load("res://Environment/Environment.tscn")

func toggle_view_type():
	renderIso = !renderIso

func get_iso(pos):
	var iso_pos: Vector2 = Vector2.ZERO
	iso_pos.x = (pos.x - pos.y) * 0.50 + Global.view.x * 0.50
	iso_pos.y = (pos.x + pos.y) * 0.25 + Global.view.y * 0.25
	return iso_pos

func get_z_index(x, y):
	return x + y

func isometric():
	var index = 0
	var x_index = 0
	var y_index = 0
	for tile in Global.tilemap:
		var ground = environment.instance()
		var elevation = Global.tileheight[index]*Global.cell.y
		ground.position = get_iso(Vector2(x_index, y_index)*Global.cell)
		ground.position.y -= elevation
		ground.z_index = get_z_index(x_index, y_index)
		ground.get_node("Isometric").set_frame(tile)
		ground.get_node("Isometric").set_visible(true)
		ground.get_node("Orthographic").set_visible(false)
		tiles.append(ground)

		index += 1
		if index % int(Global.grid.x) == 0:
			y_index += 1
		x_index = index % int(Global.grid.x)
	return tiles

func orthographic():
	var index = 0
	var x_index = 0
	var y_index = 0
	for tile in Global.tilemap:
		var ground = environment.instance()
		ground.position = Vector2(x_index, y_index)*Global.cell
		ground.get_node("Orthographic").set_frame(tile)
		ground.get_node("Isometric").set_visible(false)
		ground.get_node("Orthographic").set_visible(true)
		tiles.append(ground)

		index += 1
		if index % int(Global.grid.x) == 0:
			y_index += 1
		x_index = index % int(Global.grid.x)
	return tiles

func render():
	tiles = []
	for n in Global.root.get_node("YSort").get_children(): 
		if n.name != "Player":
			Global.root.get_node("YSort").remove_child(n) 
	if renderIso:
		Global.player.position = Global.player.pos_iso
		for graphic in isometric():
			Global.root.get_node("YSort").add_child(graphic)
	else:
		Global.player.position = Global.player.pos_ortho
		for graphic in orthographic():
			Global.root.get_node("YSort").add_child(graphic)







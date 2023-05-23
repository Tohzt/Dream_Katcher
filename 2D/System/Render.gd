extends Node
var tiles = []
var renderIso: bool = true
var environment = load("res://Environment/Environment.tscn")

func toggle_view_type():
	renderIso = !renderIso

func get_iso(pos):
	var iso_pos: Vector2 = Vector2.ZERO
	iso_pos.x = (pos.x - pos.y) * 0.50 + Global.View.x * 0.50
	iso_pos.y = (pos.x + pos.y) * 0.25 + Global.View.y * 0.25
	#TODO: Is this broken?
	return iso_pos.floor()

func get_z_index(_gx, _gy, _y):
	return _y
	#return gx*gy
	#return x*mod + y*mod + el * 100

func isometric():
	var index = 0
	var x_index = 0
	var y_index = 0
	for tile in Global.Tilemap:
		var ground = environment.instance()
		var elevation = Global.Tilemap[index] - floor(Global.Tilemap[index])
		ground.position = get_iso(Vector2(x_index, y_index)*Global.Cell)
		ground.z_index = get_z_index(x_index, y_index, ground.position.y)
		ground.position.y -= elevation*Global.Cell.y # - 16
		ground.get_node("Isometric").set_frame(tile)
		ground.get_node("Isometric").set_visible(tile > 0)
		ground.get_node("Orthographic").set_visible(false)
		tiles.append(ground)

		index += 1
		if index % int(Global.Grid.x) == 0:
			y_index += 1
		x_index = index % int(Global.Grid.x)
	return tiles

func orthographic():
	var index = 0
	var x_index = 0
	var y_index = 0
	for tile in Global.Tilemap:
		var ground = environment.instance()
		ground.position = Vector2(x_index, y_index)*Global.Cell
		ground.z_index = 1
		ground.get_node("Orthographic").set_frame(tile)
		ground.get_node("Isometric").set_visible(false)
		ground.get_node("Orthographic").set_visible(true)
		tiles.append(ground)

		index += 1
		if index % int(Global.Grid.x) == 0:
			y_index += 1
		x_index = index % int(Global.Grid.x)
	return tiles

func render():
	tiles = []
	for n in Global.Root.get_node("YSort").get_children(): 
		if n.name != "Player" && n.name != "Dog":
			Global.Root.get_node("YSort").remove_child(n) 
	if renderIso:
		Global.Player.position = Global.Player.pos_iso
		for graphic in isometric():
			Global.Root.get_node("YSort").add_child(graphic)
	else:
		Global.Player.position = Global.Player.pos_ortho
		for graphic in orthographic():
			Global.Root.get_node("YSort").add_child(graphic)







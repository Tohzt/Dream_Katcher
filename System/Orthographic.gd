extends Node

var tiles = []
var tilesize: Vector2 = Vector2(64, 64)
var tilemap = {
	Vector2(0,0): 0, Vector2(1,0): 1, Vector2(2,0): 2,
	Vector2(0,1): 0, Vector2(1,1): 1, Vector2(2,1): 2,
	Vector2(0,2): 3, Vector2(1,2): 1, Vector2(2,2): 2
}

func render():
	var environment = load("res://Environment/Environment.tscn")
	for tile in tilemap:
		var ground = environment.instance()
		ground.position = tilesize*tile
		ground.get_node("Orthographic").set_frame(tilemap[tile])
		ground.get_node("Isometric").set_visible(false)
		ground.get_node("Orthographic").set_visible(true)
		tiles.append(ground)

	return tiles

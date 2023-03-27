extends Node

var tiles = []
var tilesize: Vector2 = Vector2(64, 64)
var tilemap = {
	Vector2(0,0): 0, Vector2(1,0): 0, Vector2(2,0): 0,
	Vector2(0,1): 0, Vector2(1,1): 0, Vector2(2,1): 0,
	Vector2(0,2): 0, Vector2(1,2): 0, Vector2(2,2): 0
}

func _ready():
	print("test")

func render():
	print("testing")
	var ground = load("res://Environment/Grass.tscn")
	for tile in tilemap:
		var grass = ground.instance()
		grass.position = tilesize*tile
		tiles.append(grass)
		#get_node("YSort").add_child(grass)

	return tiles

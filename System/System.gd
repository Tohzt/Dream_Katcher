extends Node2D

var tilesize: Vector2 = Vector2(64, 64)
var mapsize: Vector2 = Vector2(3, 3)
var tilemap = {
	Vector2(0,0): 0, Vector2(1,0): 0, Vector2(2,0): 0,
	Vector2(0,1): 0, Vector2(1,1): 0, Vector2(2,1): 0,
	Vector2(0,2): 0, Vector2(1,2): 0, Vector2(2,2): 0
}

func _ready():
	var ground = load("res://Environment/Grass.tscn")
	for tile in tilemap:
		print("ind: ", tile)
		var grass = ground.instance()
		grass.position = tilesize*tile
		get_node("YSort").add_child(grass)

func get_input():
	pass

func _physics_process(_delta):
	pass

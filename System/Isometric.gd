extends Node
var tiles = []
var renderPlayer: bool = false

func _ready():
	pass

func get_pos(pos):
	var iso_pos: Vector2 = Vector2.ZERO
	iso_pos.x = (pos.x - pos.y) * 0.50 + Global.view.x * 0.50
	iso_pos.y = (pos.x + pos.y) * 0.25 + Global.view.y * 0.25
	return iso_pos

func render():
	for tile in Global.tilemap:
		var ground = load("res://Environment/Environment.tscn").instance()
		ground.position = get_pos(tile * Global.cell)
		ground.get_node("Isometric").set_visible(true)
		ground.get_node("Orthographic").set_visible(false)
		tiles.append(ground)
	return tiles


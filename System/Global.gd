extends Node2D

onready var player = get_tree().get_current_scene().get_node("Player")
onready var root = get_tree().root.get_node("Game")
onready var view = get_viewport().get_size()
onready var view_o= load("res://System/Orthographic.gd").new()
onready var view_i= load("res://System/Isometric.gd").new()
onready var view_type = "ortho"
onready var cell: Vector2 = Vector2(64, 64)
onready var tilesize: Vector2 = Vector2(cell.x/2, cell.x/4)
onready var offset = Vector2(view.x/2, view.y/4)
onready var tilemap = {
	Vector2(0,0): 0, Vector2(1,0): 1, Vector2(2,0): 2,
	Vector2(0,1): 0, Vector2(1,1): 1, Vector2(2,1): 2,
	Vector2(0,2): 3, Vector2(1,2): 1, Vector2(2,2): 2
}

func _ready():
	print("global", player)
	pass

func toggle_view_type():
	Isometric.renderPlayer = !Isometric.renderPlayer
	if view_type == "ortho":
		view_type = "iso"
	elif view_type == "iso":
		view_type = "ortho"

func render():
	if view_type == "ortho":
		for graphic in view_o.render():
			root.get_node("YSort").add_child(graphic)
	elif view_type == "iso":
		for graphic in view_i.render():
			root.get_node("YSort").add_child(graphic)

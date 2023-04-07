extends Node2D

onready var grid_container = get_node("GridContainer")
onready var grid = grid_container.get_node("Grid")
var cell: Button
var width: int
var height: int


func _ready():
	pass

func _on_Build_Grid():
	width = int(get_node("GridWidth").text)
	height = int(get_node("GridHeight").text)
	grid.columns = width
	for n in grid.get_children(): 
		grid.remove_child(n) 
	for i in width * height:
		cell = load("res://Menu/GridCell.tscn").instance()
		grid.add_child(cell)
	
func _on_Save_Grid():
	var index = 0
	Global.tilemap = []
	Global.tileheight = []
	Global.grid = Vector2(width, height)
	for i in grid.get_children():
		Global.tilemap.append(grid.get_child(index).frame)
		Global.tileheight.append(0.0)
		index += 1

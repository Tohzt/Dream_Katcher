extends Node2D

onready var grid_container = get_node("GridCenter")
onready var grid = grid_container.get_node("GridContainer")
var btn_cell: Button
var width: int
var height: int

func _ready():
	visible = false
	pass

func _on_Build_Grid():
	width = int(get_node("GridWidth").text)
	height = int(get_node("GridHeight").text)
	grid.columns = width
	clear_grid()
	for i in width * height:
		btn_cell = load("res://Menu/Editor/GridCell.tscn").instance()
		grid.add_child(btn_cell)
	
func _on_Edit_Current():
	grid.columns = Global.Grid.x
	width = int(Global.Grid.x)
	height = int(Global.Grid.y)
	clear_grid()
	var index = 0
	var _frames = []
	var _height = []
	for cell in Global.Tilemap:
		btn_cell = load("res://Menu/Editor/GridCell.tscn").instance()
		grid.add_child(btn_cell)
		_frames.append(cell)
		_height.append(Global.Tileheight[index])
		index+=1
	index = 0
	for cell in grid.get_children():
		cell.update_sprite(_frames[index])
		cell.height = _height[index]
		index += 1

func _on_Save_Grid():
	Global.Tilemap = []
	Global.Tileheight = []
	Global.Grid = Vector2(width, height)
	for cell in grid.get_children():
		Global.Tilemap.append(cell.frame)
		Global.Tileheight.append(cell.height)

func _on_SelectAll():
	for cell in grid.get_children():
		cell._on_toggle_selected(true)

func _on_Clear(): 
	for cell in grid.get_children():
		cell._on_toggle_selected(false)

func _on_Set_Type():
	for cell in grid.get_children():
		if cell.isSelected:
			cell.update_sprite( (cell.frame + 1) % cell.get_node("Sprite").hframes )

func _on_Add_Height():
	for cell in grid.get_children():
		if cell.isSelected:
			if cell.height < 0.9:
				cell.height += 0.1
				cell.visible = false
				cell.visible = true

func _on_Sub_Height():
	for cell in grid.get_children():
		if cell.isSelected:
			if cell.height > 0.0:
				cell.height -= 0.1
				cell.visible = false
				cell.visible = true

func clear_grid():
	for n in grid.get_children():
		grid.remove_child(n)

func _on_Template_1():
	Global.Player.pos_ortho = Vector2(50,50)
	grid.columns = 6
	width = int(grid.columns)
	height = int(grid.columns)
	clear_grid()
	var index = 0
	var _type = []
	var _height = []
	for xx in width:
		for yy in height:
			btn_cell = load("res://Menu/Editor/GridCell.tscn").instance()
			grid.add_child(btn_cell)
			_type.append(1)
			if xx > 1 && xx < 4 && yy > 1 && yy < 4:
				_height.append(0.2)
			else:
				_height.append(0.0)
	index = 0
	for cell in grid.get_children():
		cell.update_sprite(_type[index])
		cell.height = _height[index]
		index += 1
		_on_Save_Grid()

func _on_Template_2():
	Global.Player.pos_ortho = Vector2(50,50)
	grid.columns = 6
	width = int(grid.columns)
	height = int(grid.columns)
	clear_grid()
	var index = 0
	var _type = []
	var _height = []
	for xx in width:
		for yy in height:
			btn_cell = load("res://Menu/Editor/GridCell.tscn").instance()
			grid.add_child(btn_cell)
			_type.append(1)
			if xx == 0 || xx == 5 && yy == 0 || yy == 5:
				_height.append(0.2)
			else:
				_height.append(0.0)
	index = 0
	for cell in grid.get_children():
		cell.update_sprite(_type[index])
		cell.height = _height[index]
		index += 1
		_on_Save_Grid()











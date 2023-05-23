extends Node2D

var grid_pos = Vector2.ZERO
var pos_iso: Vector2 = Vector2.ZERO
var pos_ortho: Vector2 = Vector2(100,100)
var elevation: float = 0.1

func _ready():
	pass # Replace with function body.

func _process(_delta):
	grid_pos.x = floor(pos_ortho.x / Global.Cell.x)
	grid_pos.y = floor(pos_ortho.y / Global.Cell.y)

	if Render.renderIso:
		pos_iso = Render.get_iso(pos_ortho)
		#pos_iso.y -= 16
		position = pos_iso - Vector2(0,elevation*Global.Cell.y)
		z_index = Render.get_z_index(grid_pos.x+1, grid_pos.y+1, pos_iso.y)# + Global.z_mod*2 
	else:
		position = pos_ortho
		z_index = 2



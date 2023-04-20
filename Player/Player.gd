extends Node2D

onready var anim_controller = $Animation_Controller
onready var state_controller = $State_Controller
onready var anim_sprite: AnimatedSprite = $AnimatedSprite

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var target_dir: Vector2 = Vector2.ZERO

var elevation: float = 0.1
var elevation_climb: float = 0.1
var grid_pos = Vector2.ZERO
var pos_iso: Vector2 = Vector2.ZERO
var pos_ortho: Vector2 = Vector2(100,100)

func _ready():
	anim_controller.init(self)
	state_controller.init(self)

func _process(delta):
	state_controller.process(delta)
	grid_pos.x = floor(pos_ortho.x / Global.Cell.x)
	grid_pos.y = floor(pos_ortho.y / Global.Cell.y)

	if Render.renderIso:
		pos_iso = Render.get_iso(pos_ortho)
		#pos_iso.y -= 16
		position = pos_iso - Vector2(0,elevation*Global.Cell.y)
		z_index = Render.get_z_index(grid_pos.x+1, grid_pos.y+1, pos_iso.y)# + Global.z_mod*2 
	else:
		position = pos_ortho
		z_index = 1


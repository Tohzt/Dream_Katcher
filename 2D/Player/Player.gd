extends Node2D

onready var anim_sprite: AnimatedSprite = get_node("AnimatedSprite")
var State: Node
var anim_loop: bool
var anim_len: int
var anim_dur: int
var anim_play = true

var elevation: float = 0.1
var elevation_climb: float = 0.2
var grid_pos = Vector2.ZERO
var pos_iso: Vector2 = Vector2.ZERO
var pos_ortho: Vector2 = Vector2(100,100)

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var target_dir: Vector2 = Vector2.ZERO

var max_heal: float = 100
var max_mana: float = 100
var max_stam: float = 100
var heal: int = max_heal
var mana: int = max_mana
var stam: int = max_stam
var take_damage = 0

func _ready():
	State = get_node("Controller")
	State.init()
	#TODO: Check Foir Vulnerability

func _process(delta):
	State.process(delta)
	grid_pos.x = floor(pos_ortho.x / Global.Cell.x)
	grid_pos.y = floor(pos_ortho.y / Global.Cell.y)

	if Render.renderIso:
		pos_iso = Render.get_iso(pos_ortho)
		#pos_iso.y -= 16
		position = pos_iso - Vector2(0,elevation*Global.Cell.y)
		z_index = int(position.y)+20
	else:
		position = pos_ortho
		z_index = 2


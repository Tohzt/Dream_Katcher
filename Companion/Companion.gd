extends Node2D

onready var anim_sprite: AnimatedSprite = get_node("AnimatedSprite")
var State: Node
var anim_loop: bool
var anim_len: int
var anim_dur: int

var elevation: float = 0.1
var elevation_climb: float = 0.2
var grid_pos = Vector2.ZERO
var pos_iso: Vector2 = Vector2.ZERO
var pos_ortho: Vector2 = Vector2(150,150)

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO
var target_dir: Vector2 = Vector2.ZERO
var target_pos: Vector2
var target_dist: int = 40

func _ready():
	target_pos = pos_ortho
	for child in get_children():
		if child.name == "Controller":
			State = child
			State.init()

func _process(delta):
	State.process(delta)
	grid_pos.x = floor(pos_ortho.x / Global.Cell.x)
	grid_pos.y = floor(pos_ortho.y / Global.Cell.y)

	if Render.renderIso:
		pos_iso = Render.get_iso(pos_ortho)
		position = pos_iso - Vector2(0,elevation*Global.Cell.y)
		z_index = int(position.y+3)
	else:
		position = pos_ortho
		z_index = 2


extends Control
var test = "control test"
onready var player: Node2D = Global.player
var player_spr
var player_pos: Vector2

func _ready():
		player_spr = player.get_node("Player_Sprite").get_texture()
		player_pos = player.position
		pass

func _process(_delta):
		player_pos = Isometric.get_pos(player.position)
		update()

func _draw():
		if Isometric.renderPlayer:
				var offset = Vector2(player_spr.get_width() / 2, player_spr.get_height())
				draw_texture(player_spr, player_pos - offset)


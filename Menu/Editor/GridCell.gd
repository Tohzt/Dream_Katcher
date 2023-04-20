extends Button

onready var frame = 0
onready var height = 0.0

var isSelected = false
onready var Sprite = get_node("Sprite")
onready var Selected = get_node("Selected")

func _on_toggle_selected(toggle = !isSelected):
	isSelected = toggle
	Selected.visible = isSelected

func update_sprite(new_frame = 0):
	frame = new_frame
	Sprite.frame = frame

func _draw():
	var _s = 28
	var _h = height * _s
	draw_line(Vector2(0,_s-_h+2), Vector2(_s+4, _s-_h+2), Color(255, 255, 255), 1)


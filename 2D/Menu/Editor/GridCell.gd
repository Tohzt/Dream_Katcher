extends Button

onready var value: float = 0.0

var isSelected = false
onready var Sprite = get_node("Sprite")
onready var Selected = get_node("Selected")

func _on_toggle_selected(toggle = !isSelected):
	isSelected = toggle
	Selected.visible = isSelected

func update_sprite(new_value: float = 0.0):
	value = new_value
	Sprite.frame = int(value)

func _draw():
	var _s = 28
	var _h = (value - floor(value)) * _s
	draw_line(Vector2(0,_s-_h+2), Vector2(_s+4, _s-_h+2), Color(255, 255, 255), 1)


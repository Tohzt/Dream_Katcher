extends Button

var frame = 1
onready var sprite = get_node("Sprite")

func _on_change_frame():
	frame = (frame + 1) % sprite.hframes
	sprite.frame = frame

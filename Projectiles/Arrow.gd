extends Node2D

var direction: Vector2
var speed: int
var status = "none"

func _ready():
	speed = 500
	pass # Replace with function body.

func _process(delta):
	if position.distance_to(Global.Player.pos_iso) > 500:
		self.queue_free()
	position += direction * speed * delta
	z_index = position.y

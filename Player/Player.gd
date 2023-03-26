extends Node2D

var speed: int = 100
var velocity: Vector2 = Vector2.ZERO

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction.normalized() * speed

func _physics_process(delta):
	get_input()
	position += velocity*delta

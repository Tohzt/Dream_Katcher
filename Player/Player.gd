extends Node2D

var speed: int = 200
var velocity: Vector2 = Vector2.ZERO

func _input(event):
	#if event is InputEventKey:
		#if event.is_pressed():
			var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
			velocity = input_direction.normalized()

func _physics_process(delta):
	position += velocity*delta*speed
	$Player_Sprite.visible = true
	if Isometric.renderPlayer:
		$Player_Sprite.visible = false

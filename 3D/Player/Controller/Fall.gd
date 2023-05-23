extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()

func init() -> void:
	pass

func process(_move, look, _delta):
	if master.input.y > Global.TERMINAL:
		master.input.y += Global.GRAVITY
	if master.is_on_floor():
		master.input.y = -1*master.velocity.y
		master.isIdle = true

	## Set Looking
	var fall_angle = master.jump_dir.angle() - deg_to_rad(90)
	if look && false:
		fall_angle = look.angle() - deg_to_rad(90)
	## Set Moving
	master.rotation.y = fall_angle
	master.input.x = master.jump_dir.x * master.speed
	master.input.z = -master.jump_dir.y * master.speed

func check_state():
	if master.isIdle:
		master.isFalling = false
		#master.fall_dir = Vector2.ZERO
		return controller.States.IDLE
	return controller.States.NULL

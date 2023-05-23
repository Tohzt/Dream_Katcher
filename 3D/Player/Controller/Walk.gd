extends Node3D

@onready var controller := get_parent()
@onready var master := controller.get_parent()

func init() -> void:
	pass

func process(move, _look, _delta):
	var move_angle = move.angle() - deg_to_rad(90)
	if move:
		master.speed = master.SPEED_WALK
		master.rotation.y = move_angle
		master.input.x = move.x
		master.input.z = -move.y
		"""
		if look:
			move_angle = look.angle() - deg_to_rad(90)
			master.isWalking = false
			master.isRunning = true
			master.speed = master.SPEED_DEFAULT*4
		else:
			master.isWalking = true
			master.isRunning = false
			master.speed = master.SPEED_DEFAULT*3
		"""
	else:
		master.isIdle = true

	if !master.is_on_floor():
		master.isFalling = true


func check_state():
	if master.isBlocking:
		master.isWalking = false
		master.isRunning = false
		return controller.States.BLOCK

	if master.isAttacking:
		master.isWalking = false
		master.isRunning = false
		return controller.States.ATTACK

	if master.isIdle:
		master.isWalking = false
		master.isRunning = false
		master.speed = master.SPEED_DEFAULT
		return controller.States.IDLE

	if master.isJumping:
		master.isWalking = false
		master.isRunning = false
		#master.jump_dir = move
		master.speed = master.SPEED_DEFAULT
		return controller.States.JUMP

	if master.isFalling:
		master.isWalking = false
		master.isRunning = false
		master.speed = master.SPEED_DEFAULT
		return controller.States.FALL

	return controller.States.NULL

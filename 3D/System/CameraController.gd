extends Node3D

@onready var Player = get_tree().get_nodes_in_group("Player")[0]
@onready var Tripod = get_node("SpringArm3D")
var Target: Vector3

@export var def_dist: float
@export var def_height: float
@export var def_angle: float

#var cam_locked := false
var cam_direction
var cam_input: Vector2
var cam_speed = deg_to_rad(1)
var cam_snap = deg_to_rad(4)
var tar_direction
var tar_speed = 5
var tar_snap = 10

func _ready():
	Target = Player.position
	Tripod.rotation.x = deg_to_rad(def_angle)
	Tripod.position.y = def_height
	Tripod.position.z = def_dist
	rotation.y = deg_to_rad(45)

	cam_direction = rotation.y
	tar_direction = cam_direction

func _process(_delta):
	#TODO: Update to follow any target
	Target = Player.position
	position.x = Target.x
	position.z = Target.z

	# Follow target position at given speed
	"""
	if position.x < Target.x-tar_snap:
		position.x += tar_speed
	elif position.x > Target.x+tar_snap:
		position.x -= tar_speed

	if position.z < Target.z-tar_snap:
		position.z += tar_speed
	elif position.z > Target.z+tar_snap:
		position.z -= tar_speed
	"""

	if Player.is_on_floor():
		position.y = Target.y


func _input(_event):
	pass
	"""
	if Input.is_action_pressed("LBUMP"):
		cam_locked = true
	if Input.is_action_just_released("LBUMP"):
		cam_locked = false

	if Input.is_action_pressed("LBUMP"):
		cam_direction -= deg_to_rad(45)
	if Input.is_action_pressed("RBUMP"):
		cam_direction += deg_to_rad(45)
	"""
	

## Control Camera with LStick
"""
func _process(_delta):
	#TODO: Update to follow any target
	Target = Player.position
	position.x = Target.x
	position.z = Target.z

	# Get position input from player
	if !cam_locked:
		cam_input = -Input.get_vector("RS_LEFT", "RS_RIGHT", "RS_UP", "RS_DOWN").normalized()
		#cam_input = Vector2.ZERO
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if cam_input:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Tripod.rotation.x = clamp(Tripod.rotation.x+cam_input.y*cam_speed/5 , -0.6, -0.2)
		Tripod.position.z = clamp(Tripod.position.z-cam_input.y*cam_speed*2 , 1.2, 5.0)
		Tripod.position.y = clamp(Tripod.position.y-cam_input.y*cam_speed*2 , 0.7, 4.7)
		tar_direction += cam_input.x*cam_speed

	# Approach target direction at given speed
	if cam_direction < tar_direction-cam_snap:
		cam_direction += cam_speed
	elif cam_direction > tar_direction+cam_snap:
		cam_direction -= cam_speed
	else:
		cam_direction = tar_direction
	rotation.y = cam_direction

	if Player.is_on_floor():
		position.y = Target.y
"""

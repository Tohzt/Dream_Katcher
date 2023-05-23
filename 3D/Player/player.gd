extends EntityBase

const SPEED_DEFAULT = 10
const SPEED_WALK = SPEED_DEFAULT * 4
var speed = SPEED_DEFAULT
var input := Vector3.ZERO
var input_move: Vector2 = Vector2(0,0)
var input_look: Vector2 = Vector2(0,0)
var input_jump = 22
var jump_dir := Vector2.ZERO
var hasWeapon = ""
@onready var StateController = get_node("PlayerController")
@onready var PlayerAnimation = get_node("PlayerAnimation").get_node("AnimationPlayer")

func _ready():
	anim_idle = "aIdle"
	anim_walk = "aWalk"
	anim_run = "aRun"
	anim_jump = "aJump"
	anim_fall = "aFall"
	anim_attack = "aAttack1"
	if StateController.get_child_count():
		StateController.init()

func _input(_event):
	input_move = Input.get_vector("LS_LEFT", "LS_RIGHT", "LS_DOWN", "LS_UP").normalized()
	input_move = input_move.rotated(Global.Camera.rotation.y)
	input_look = Input.get_vector("RS_LEFT", "RS_RIGHT", "RS_DOWN", "RS_UP").normalized()

	## Jump Input
	if !isJumping && (isIdle || isWalking || isRunning):
		if Input.is_action_just_pressed("JUMP") || Input.is_action_just_pressed("RS_CLICK"):
			isJumping = true

func _physics_process(delta):
	StateController.process(input_move, input_look, delta)
	
	velocity = Vector3(input.x, input.y, input.z) + velocity
	if velocity.y < Global.TERMINAL:
		velocity.y = Global.TERMINAL

	velocity = velocity * speed * delta 
	move_and_slide()
	update_animation(PlayerAnimation)

func equip(item):
	hasWeapon = "item"
	anim_idle		= anim_idle.get_slice("_", 0) + "_" + item
	anim_walk		= anim_walk.get_slice("_", 0) + "_" + item
	anim_run		= anim_run.get_slice("_", 0) + "_" + item
	anim_jump		= anim_jump.get_slice("_", 0) + "_" + item
	anim_fall		= anim_fall.get_slice("_", 0) + "_" + item
	anim_attack = anim_attack.get_slice("_", 0) + "_" + item

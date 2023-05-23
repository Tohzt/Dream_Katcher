extends Node3D
@onready var current = [
	$Idle,
	$Walk,
	$Jump,
	$Fall,
	$Attack,
	$Block,
]
enum States {
	IDLE,
	WALK,
	JUMP,
	FALL,
	ATTACK,
	BLOCK,
	NULL = -1,
}
var Master: EntityBase
var State: Node3D

func init() -> void:
	Master = get_parent()
	State = current[States.IDLE]

func change_state(new_state: int) -> void:
	State = current[new_state]
	State.init()

func process(move, look, delta):
	#TODO: Remove if State?
	if State:
		State.process(move, look, delta)
		var new_state = State.check_state()
		if new_state != -1:
			change_state(new_state)

func _input(_event):
	if Input.is_action_just_pressed("R1"):
		if Master.hasWeapon != "":
			Master.isAttacking = true

	if Input.is_action_just_pressed("L1"):
		if Master.hasWeapon != "":
			Master.isBlocking = true
	elif Input.is_action_just_released("L1"):
		if Master.hasWeapon != "":
			Master.isIdle = true

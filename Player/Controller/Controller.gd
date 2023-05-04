extends Node

enum States {
	NULL,
	IDLE,
	WALK,
	DODGE,
	HURT,
	ABILITY,
}
onready var current = [
	$Animation,
	$Idle,
	$Walk,
	$Dodge,
	$Hurt,
	$Ability,
]

onready var Master: Node2D = get_parent()
var State: player_state
var Animation: base_animation
var input_direction: Vector2 = Vector2(0,0)
var input_target_direction: Vector2 = Vector2(0,0)

func init() -> void:
	change_state(States.IDLE)

func change_state(new_state: int) -> void:
	State = current[new_state]
	State.init(Master, States, current, new_state)
	Animation = current[0]
	Animation.init(Master)

func process(delta):
	if Animation:
		Animation.process(input_direction, input_target_direction)
	if State:
		State.process(input_direction, input_target_direction, delta)
		# Update Current State
		var new_state = State.check_state()
		if new_state != States.NULL:
			change_state(new_state)

func _input(_event):
	Master.velocity = Vector2.ZERO
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	input_target_direction = Input.get_vector("ui_aim_left", "ui_aim_right", "ui_aim_up", "ui_aim_down").normalized()
	if Render.renderIso:
		input_direction = input_direction.rotated(deg2rad(-45))
		input_target_direction = input_target_direction.rotated(deg2rad(-45))
	
	if Input.is_action_pressed("ui_select"):
		pass#change_state(States.HURT)

	if Input.is_action_just_pressed("ui_ability_l2"):
		change_state(States.ABILITY)
	if Input.is_action_just_released("ui_ability_l2"):
		change_state(States.IDLE)







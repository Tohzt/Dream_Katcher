extends Node

onready var STATES = {
	BaseState.STATES_enum.idle: $Idle,
	BaseState.STATES_enum.walk: $Walk,
	#BaseState.STATES_enum.dodge: $STATE_dodge,
	#BaseState.STATES_enum.attack: $STATE_attack,
	#BaseState.STATES_enum.dead: $STATE_dodge,
}

var current_state: BaseState
var player: Node2D
var input_direction: Vector2
var input_target_direction: Vector2

func init(_player: Node2D) -> void:
	player = _player
	current_state = STATES[BaseState.STATES_enum.idle]

func change_state(new_state: int) -> void:
	if current_state:
		current_state.exit()
	# Update Anim to match current_state
	player.anim_controller.change_anim(new_state)
	current_state = STATES[new_state]
	current_state.enter(player)

func process(delta):
	if current_state:
		current_state.process(input_direction, input_target_direction, delta)
		# Update Current State
		var new_state = current_state.check_state()
		if new_state != BaseState.STATES_enum.Null:
			change_state(new_state)

func _input(_event):
	player.velocity = Vector2.ZERO
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	input_target_direction = Input.get_vector("ui_aim_left", "ui_aim_right", "ui_aim_up", "ui_aim_down").normalized()
	if Render.renderIso:
		input_direction = input_direction.rotated(deg2rad(-45))
		input_target_direction = input_target_direction.rotated(deg2rad(-45))


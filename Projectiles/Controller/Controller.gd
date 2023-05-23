extends Node

enum States {
	NULL,
	KNOCK,
	FLY,
	STUCK,
	BREAK,
	#HURT,
}
onready var current = [
	$Animation,
	$Knock,
	$Fly,
	$Stuck,
	$Break,
	#$Hurt,
]

onready var Master: Node2D = get_parent()
var State: projectile_state
var Animation: base_animation

func init() -> void:
	change_state(States.KNOCK)

func change_state(new_state: int) -> void:
	State = current[new_state]
	State.init(Master, States, current, new_state)
	#Animation = current[0]
	#Animation.init(Master)

func process(delta):
	#if Animation:
		#Animation.process(Master.target_dir)
	if State:
		State.process(delta)
		var new_state = State.check_state()
		if new_state != States.NULL:
			change_state(new_state)


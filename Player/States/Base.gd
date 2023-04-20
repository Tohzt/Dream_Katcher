class_name BaseState
extends Node
enum STATES_enum {
	Null,
	idle,
	walk,
	dodge,
	attack,
	dead
}

var friction = 2.5
var speed_min = 200
var speed_def = 300
var speed_max = 400
var speed = speed_def
var is_moving = false

var Player: Node2D

func enter(player: Node2D):
	Player = player
	pass

func check_state() -> int:
	return STATES_enum.Null

func move(_move):
	pass

func exit():
	pass


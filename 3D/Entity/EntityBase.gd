class_name EntityBase
extends CharacterBody3D

var max_heal := 100.0
var max_stam := 100.0
var max_mana := 100.0
var heal := max_heal
var stam := max_stam
var mana := max_mana

var isIdle			= true
var isWalking		= false
var isRunning		= false
var isJumping		= false
var isFalling		= false
var isAttacking = false
var isBlocking	= false

var anim_idle		= "aIdle"
var anim_walk		= "aWalk"
var anim_run		= "aRun"
var anim_jump		= "aJump"
var anim_fall		= "aFall"
var anim_attack = "aAttack1"
var anim_block  = "aBlock"

func update_animation(animation):
	#var animation = get_node(anim).get_node("AnimationPlayer")
	if isIdle:				animation.play(anim_idle);
	elif isWalking:		animation.play(anim_walk);
	elif isRunning:		animation.play(anim_run);
	elif isJumping:		animation.play(anim_jump);
	elif isFalling:		animation.play(anim_fall);
	elif isAttacking: animation.play(anim_attack);
	elif isBlocking:	animation.play(anim_block);
	


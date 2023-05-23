extends Node3D

@onready var Anim = get_node("AnimationPlayer")

func _ready():
	print(rotation)
	Anim.play("aIdle")

func _process(_delta):
	pass

func take_damage():
	Anim.play("aHit")

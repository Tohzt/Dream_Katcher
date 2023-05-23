extends CanvasLayer

@onready var player := get_parent()
@onready var animation := player.get_node("PlayerAnimation").get_node("AnimationPlayer")
@onready var container := get_node("VBoxContainer")

func _ready():
	animation.play("aIdle")

func _process(_delta):
	for child in container.get_children():
		var stringName = ""
		if child.name == "isIdle":
			stringName = "yes" if player.isIdle else "no"
			child.text = "Idle: " + stringName
		if child.name == "isWalking":
			stringName = "yes" if player.isWalking else "no"
			child.text = "Walk: " + stringName
		if child.name == "isRunning":
			stringName = "yes" if player.isRunning else "no"
			child.text = "Runn: " + stringName
		if child.name == "isJumping":
			stringName = "yes" if player.isJumping else "no"
			child.text = "Jump: " + stringName
		if child.name == "isFalling":
			stringName = "yes" if player.isFalling else "no"
			child.text = "Fall: " + stringName
		if child.name == "Animation":
			child.text = "Animation: " + animation.current_animation


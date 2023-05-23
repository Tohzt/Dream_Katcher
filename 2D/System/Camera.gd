extends Camera2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	var focus_player = true
	for child in Global.Root.get_children():
		if child.name == "Menu":
			focus_player = false
			position = Vector2(480,270)
	if focus_player:
		position = Global.Player.position

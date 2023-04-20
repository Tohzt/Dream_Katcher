extends Button

func _on_Start():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if !Global.Root.get_node("YSort").has_node("Player"):
		var Anim = load("res://Player/Animations/Animation_Controller.tscn").instance()
		Global.Player.add_child(Anim)
		var State = load("res://Player/States/State_Controller.tscn").instance()
		Global.Player.add_child(State)

		var companion = load("res://Companion/Companion.tscn").instance()
		Global.Root.get_node("YSort").add_child(companion)
		Global.Root.get_node("YSort").add_child(Global.Player)
	Render.render()
	get_parent().get_parent().queue_free()

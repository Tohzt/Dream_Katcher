extends Button


func _on_Start():
	Global.Root.get_node("HUD").visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if !Global.Root.get_node("YSort").has_node("Player"):
		#Global.Player.add_child(load("res://Player/Controller/Controller.tscn").instance())
		var companion = load("res://Companion/Companion.tscn").instance()
		Global.Root.get_node("YSort").add_child(companion)
		Global.Root.get_node("YSort").add_child(Global.Player)
	Render.render()
	get_parent().get_parent().queue_free()

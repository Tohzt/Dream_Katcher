extends Button

func _on_Start():
	if !Global.root.get_node("YSort").has_node("Player"):
		Global.root.get_node("YSort").add_child(Global.player)
	Render.render()
	get_parent().get_parent().queue_free()

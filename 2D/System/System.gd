extends Node2D

func _input(event):
	if event.is_action_pressed("ui_cancel") && !Global.Root.has_node("Menu"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		var menu = load("res://Menu/Menu.tscn").instance()
		menu.z_index = 999
		Global.Root.add_child(menu)
		Global.Root.get_node("HUD").visible = false
		
	if event.is_action_pressed("ui_focus_next"):
		Render.toggle_view_type()
		Render.render()

func _physics_process(_delta):
	pass

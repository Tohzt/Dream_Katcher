extends Node2D

func _ready():
	Global.render()

func _input(event):
	if event.is_action_pressed("ui_focus_next"):
		for n in get_node("YSort").get_children(): get_node("YSort").remove_child(n) 
		Global.toggle_view_type()
		Global.render()

func _physics_process(_delta):
	pass

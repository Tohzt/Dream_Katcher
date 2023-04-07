extends Button
onready var Menu_Edit = get_parent()
onready var Menu_Main = get_parent().get_parent().get_node("Main")

func _on_Back():
	Menu_Edit.visible = false
	Menu_Main.visible = true

extends Button
onready var Menu_Main = get_parent()
onready var Menu_Edit = get_parent().get_parent().get_node("Map Editor")

func _on_Edit():
	Menu_Edit.visible = true
	Menu_Main.visible = false

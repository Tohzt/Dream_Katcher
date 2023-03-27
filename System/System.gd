extends Node2D

onready var orthographic = load("res://System/Orthographic.gd").new()

func _ready():
	print("ortho: ", orthographic.render())
	for graphic in orthographic.render():
		get_node("YSort").add_child(graphic)


func get_input():
	pass

func _physics_process(_delta):
	pass

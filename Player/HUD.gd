extends CanvasLayer

onready var vitals = get_node("Vitals")

func _ready():
	pass # Replace with function body.

func _process(_delta):
	vitals.get_node("Health").scale.x  = Global.Player.heal / Global.Player.max_heal
	vitals.get_node("Mana").scale.x		 = Global.Player.mana / Global.Player.max_mana
	vitals.get_node("Stamina").scale.x = Global.Player.stam / Global.Player.max_stam

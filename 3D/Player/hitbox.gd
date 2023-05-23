extends Area3D
var timer = 10

func _ready():
	pass

func _process(_delta):
	timer -= 1
	if timer <= 0:
		queue_free()

func _on_body_entered(body):
	timer = 0
	body.get_parent().Anim.play("aHit")

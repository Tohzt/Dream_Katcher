extends projectile_state

func process(_delta):
	master.rotation = master.target_dir.angle()
	if Render.renderIso:
		master.rotation = master.target_dir.rotated(deg2rad(45)).angle()

func check_state() -> int:
	return states.FLY


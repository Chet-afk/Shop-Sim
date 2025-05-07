extends PlayerState

func _handle_frame(delta: float) -> PlayerState:
	parent.velocity = Input.get_vector("Left","Right","Up","Down") * parent.speed
	parent.move_and_slide()
	
	if not Input.is_anything_pressed():
		return get_node("../Idle")
	
	return null

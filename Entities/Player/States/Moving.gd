extends PlayerState

func _handle_frame(delta: float) -> PlayerState:
	
	var inputVector = Input.get_vector("Left","Right","Up","Down")
	
	parent.velocity = inputVector * parent.speed
	parent.move_and_slide()
	
	if not Input.is_anything_pressed():
		return get_node("../Idle")
	
	# Has to be here or else it will reset to 0 when no inputs are recognized
	parent.get_node("InteractArea").set_rotation(inputVector.angle())
	return null

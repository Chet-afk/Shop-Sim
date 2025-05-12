extends PlayerState

func _handle_physics_frame(delta: float) -> PlayerState:
	
	if not Input.is_anything_pressed():
		return get_node("../Idle")
	
	# Without this, inputs while not moving will reset the interaction zone
	if (Input.is_action_pressed("Down") or Input.is_action_pressed("Up") or
	Input.is_action_pressed("Left") or Input.is_action_pressed("Right")):
		var inputVector = Input.get_vector("Left","Right","Up","Down")
		parent.velocity = Vector2(inputVector.x * parent.hSpeed, 
			inputVector.y * parent.vSpeed)
		parent.move_and_slide()
		parent.interactArea.set_rotation(inputVector.angle())
	return null

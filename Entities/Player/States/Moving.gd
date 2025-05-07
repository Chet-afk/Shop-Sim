extends PlayerState

func _handle_frame(delta: float) -> PlayerState:
	if Input.is_action_pressed("Down"):
		print("DOWN")
		parent.velocity = Vector2.DOWN * parent.speed
	elif Input.is_action_pressed("Up"):
		print("Up")
		parent.velocity = Vector2.UP * parent.speed
	elif Input.is_action_pressed("Left"):
		print("Left")
		parent.velocity = Vector2.LEFT * parent.speed
	elif Input.is_action_pressed("Right"):
		print("Right")
		parent.velocity = Vector2.RIGHT * parent.speed
	parent.move_and_slide()
	
	if not Input.is_anything_pressed():
		return get_node("../Idle")
	
	return null

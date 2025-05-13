extends PlayerState

func _startup() -> void:
	
	animSprite.set_animation("down")
	animSprite.play()
	return 

func _handle_physics_frame(delta: float) -> PlayerState:
	
	if not Input.is_anything_pressed():
		return get_node("../Idle")
	
	# Without this, inputs while not moving will reset the interaction zone
	if (Input.is_action_pressed("Down") or Input.is_action_pressed("Up") or
		Input.is_action_pressed("Left") or Input.is_action_pressed("Right")):
		var inputVector = Input.get_vector("Left","Right","Up","Down")
		var velo = Vector2(inputVector.x * parent.hSpeed, 
			inputVector.y * parent.vSpeed)
		parent.velocity = velo
		parent.move_and_slide()
		parent.interactArea.set_rotation(inputVector.angle())
		
		# Change Animation based off quadrant the angle is in
		# Unit circle has positives in the bottom two quadrants
		if (velo.angle() < Vector2.RIGHT.angle() and 
			velo.angle() > (Vector2.LEFT.angle() * -1) and
			animSprite.animation != "up"):
			animSprite.set_animation("up")
		elif (velo.angle() >= Vector2.RIGHT.angle() and 
			velo.angle() <= (Vector2.LEFT.angle()) and
			animSprite.animation != "down"):
			animSprite.set_animation("down")
		
		if (velo.x < 0 and not animSprite.is_flipped_h()):
			animSprite.set_flip_h(true)
		elif (velo.x >= 0 and animSprite.is_flipped_h()):
			animSprite.set_flip_h(false)

	return null

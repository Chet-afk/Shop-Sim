extends PlayerState

func _startup() -> void:
	parent.velocity = Vector2.ZERO
	animSprite.set_animation("idle")
	animSprite.play()
	return 

func _handle_input(input: InputEvent) -> PlayerState:
	
	# calling super alone won't set it back to the statemachine
	var potentialState = super(input)
	if potentialState:
		return potentialState
	
	
	
	if (input.is_action("Down") or input.is_action("Left") 
	or input.is_action("Right") or input.is_action("Up")):
		get_viewport().set_input_as_handled()
		# Deal with minor stick drift
		var horiAxis = Input.get_axis("Left", "Right")
		var vertAxis = Input.get_axis("Up", "Down")
		if (abs(horiAxis) < 0.05 and abs(vertAxis) < 0.05):
			return null
		return get_node("../Moving")
	
	
	return null

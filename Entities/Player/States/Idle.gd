extends PlayerState

func startup() -> void:
	parent.velocity = Vector2.ZERO

func _handle_input(input: InputEvent) -> PlayerState:
	
	if (input.is_action("Down") or input.is_action("Left") 
	or input.is_action("Right") or input.is_action("Up")):
		return get_node("../Moving")
	return null

extends PlayerState

func startup() -> void:
	parent.velocity = Vector2.ZERO

func _handle_input(input: InputEvent) -> PlayerState:
	
	super(input)
	
	if (input.is_action("Down") or input.is_action("Left") 
	or input.is_action("Right") or input.is_action("Up")):
		get_viewport().set_input_as_handled()
		return get_node("../Moving")
	
	return null

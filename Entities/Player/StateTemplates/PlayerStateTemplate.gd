extends GeneralState
class_name PlayerState

@export var parent : Player

func _handle_input(input: InputEvent) -> PlayerState:
	
	# Things all player states need (generally)
	
	# Areas will be on interactable objects
	# Not checking bodies since even walls will have bodies
	if (input.is_action_pressed("Action") 
	and parent.interactArea.has_overlapping_areas()):
		get_viewport().set_input_as_handled()
		print(parent.interactArea.get_overlapping_areas())
	return null

func _handle_physics() -> PlayerState:
	return null

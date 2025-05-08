extends GeneralStateMachine
class_name PlayerStateMachine

# use _input for things that are single press, not persistent
func _input(input: InputEvent) -> void:
	var potentialState = curState._handle_input(input)
	
	if potentialState:
		self.move_to_state(potentialState)

func _process(delta: float) -> void:
	var potentialState = curState._handle_frame(delta)
	# Non null state means to change state
	if potentialState:
		self.move_to_state(potentialState)

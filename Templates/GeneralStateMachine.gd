extends Node
class_name GeneralStateMachine

# Change types to whatever States its looking for
@export var initState: GeneralState
var curState: GeneralState

func setup(parent) -> void:
	# Give all states (children of this node) the reference to the parent node
	# that will be acted upon so each state can do what it needs to do.
	# Don't have to set the specific node with export, nor do you have to 
	# setup references to get the parent
	for state in get_children():
		state.parent = parent
	curState = initState
	curState._startup()


func move_to_state(new_state: GeneralState) -> void:
	# Simple check, ensure current state exists before calling cleanup
	if curState:
		curState._cleanup()
		
	curState = new_state
	curState._startup()


	

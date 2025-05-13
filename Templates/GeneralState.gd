extends Node
class_name GeneralState

# Set the parent to whatever type the parent is most likely gonna be
# @export var parent : Player

func _cleanup() -> void:
	return 

func _startup() -> void:
	return 
	
func _handle_frame(delta: float) -> GeneralState:
	return null

func _handle_physics_frame(delta: float) -> GeneralState:
	return null

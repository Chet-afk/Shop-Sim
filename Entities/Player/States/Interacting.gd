extends PlayerState

# This states is intended to be a dead end.
# It overrides all input events so that inputs can
# go to Gui Event.
# UI is the only one that can get player out of this state

func _handle_input(input: InputEvent) -> PlayerState:
	return null
	
func _cleanup() -> void:
	return 

func _startup() -> void:
	parent.velocity = Vector2.ZERO
	animSprite.pause()
	return 

func _handle_physics() -> PlayerState:
	return null

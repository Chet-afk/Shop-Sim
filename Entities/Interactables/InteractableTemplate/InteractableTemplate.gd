extends Node
class_name GeneralInteractable

# This goes on Area2D since that is what the player interaction
# button is relative to
var text : Array[String]

# This function will be overridden since this is a general template
# If you see this, find the offending item and override it
func _ready() -> void:
	text.append("OVERRIDE READY FUNCTION")

func display_text():
	UiSignals.give_text.emit(text)

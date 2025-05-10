extends Node

@onready var textBox := $Panel/Label

# Dialogue box always "there", only show when needed
func _ready() -> void:
	self.visible = false
	UiSignals.display_text.connect(display_dialogue)

# Dialogue is held by interactables, which will call this function.
# They will back and forth until dialogue is over.
func display_dialogue(text: Array[String]):
	self.visible = true
	textBox.text = text[0]
	

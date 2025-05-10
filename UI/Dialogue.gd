extends Control

var text : Array[String]
var textLen := 0
var readText := 0
@onready var textBox := $Panel/Label

# Dialogue box always "there", only show when needed
func _ready() -> void:
	self.visible = false
	UiSignals.give_text.connect(hold_text)

# Dialogue is held by interactables, which will call this function.
# They will back and forth until dialogue is over.
func hold_text(obtainedText: Array[String]):
	self.grab_focus()
	self.visible = true
	text = obtainedText
	textLen = text.size()
	display_text()
	

func _gui_input(event: InputEvent) -> void:
	if (event.is_action_pressed("Action") and self.has_focus()):
		accept_event()
		display_text()
		

func display_text() -> void:

	if readText == textLen:
		cleanup()
		return
		
	textBox.text = text[readText]
	readText += 1

	
func cleanup():
	readText = 0
	textLen = 0
	text.clear()
	self.visible = false
	self.release_focus()
	UiSignals.set_player_idle.emit()

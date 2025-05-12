extends Control

var text : Array[String]
var textLen := 0
var readText := 0
@onready var textBox := $Panel/Label

# Dialogue box always "there", only show when needed
func _ready() -> void:
	self.visible = false
	UiSignals.give_text.connect(hold_text)
	resize_nodes()
		
func resize_nodes():
	var children = get_all_nodes(self)
	var size = get_tree().root.size
	for each_child in children:
		each_child.size = Vector2i(size.x - self.position.x - 100,
			 size.y - self.position.y - 20)

func get_all_nodes(node) -> Array:
	var children := []
	for child in node.get_children():
		if child.get_child_count() > 0:
			children.append(child)
			children.append_array(get_all_nodes(child))
		else:
			children.append(child)
	return children

# Dialogue is held by interactables, which will call this function.
# They will back and forth until dialogue is over.
func hold_text(obtainedText: Array[String]):
	self.grab_focus()
	self.visible = true
	text = obtainedText.duplicate(true)
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

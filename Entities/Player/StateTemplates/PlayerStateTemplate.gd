extends GeneralState
class_name PlayerState

var parent : Player
var animSprite : AnimatedSprite2D


func _handle_input(input: InputEvent) -> PlayerState:
	# Things all player states need (generally)
	
	# Areas will be on interactable objects
	# Not checking bodies since even walls will have bodies
	if (input.is_action_pressed("Action") 
	and parent.interactArea.has_overlapping_areas()):
		# Stop propogating input
		get_viewport().set_input_as_handled()
		
		# Find closest interactable
		var interactables = parent.interactArea.get_overlapping_areas()
		var closest_node = null
		var shortest_distance = null
		for each_interactable in interactables:
			if closest_node == null:
				closest_node = each_interactable
				shortest_distance = \
				parent.position.distance_to(each_interactable.position)
			elif (parent.position.distance_to(each_interactable.position) 
			< shortest_distance):
				closest_node = each_interactable
				shortest_distance = \
				self.position.distance_to(each_interactable.position)
		closest_node.display_text()
		return get_node("../Interacting")
	
	return null

func _handle_physics() -> PlayerState:
	return null

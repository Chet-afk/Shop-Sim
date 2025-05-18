extends CharacterBody2D
class_name Player

@export var hSpeed := 1000
@export var vSpeed := 300
@onready var stateMachine := $StateMachine
@onready var interactArea := $InteractArea

var interactablesArray : Array[GeneralInteractable] = []

func _ready() -> void:
	stateMachine.setup(self)
	UiSignals.set_player_idle.connect(set_idle)
	
func set_idle():
	stateMachine.move_to_state($StateMachine/Idle)

func get_animation() -> String:
	return $AnimatedSprite2D.animation


func _on_interact_area_area_entered(area: Area2D) -> void:
	if area.get_owner() is GeneralInteractable:
		interactablesArray.append(area.get_owner())

func _on_interact_area_area_exited(area: Area2D) -> void:
	if area.get_owner() is GeneralInteractable:
		interactablesArray.erase(area.get_owner())

extends CharacterBody2D
class_name Player

@export var hSpeed := 1000
@export var vSpeed := 300
@onready var stateMachine := $StateMachine
@onready var interactArea := $InteractArea

func _ready() -> void:
	stateMachine.setup(self)
	UiSignals.set_player_idle.connect(set_idle)
	
func set_idle():
	stateMachine.move_to_state($StateMachine/Idle)

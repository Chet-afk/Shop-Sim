extends CharacterBody2D
class_name Player

@export var speed := 200

@onready var stateMachine := get_node("StateMachine")
@onready var interactArea := get_node("InteractArea")

func _ready() -> void:
	stateMachine.setup(self)

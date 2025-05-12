extends Camera2D

func _ready() -> void:
	UiSignals.enable_camera.connect(enable_camera)


func enable_camera(mode: bool):
	self.enabled = mode

extends Node3D

class_name MouseLook

@export var _player: CharacterBody3D

@export_group("CameraRotateSettings")

@export var minRotationX: float = -25.0
@export var maxRotationX: float = 25.0

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_player.rotation_degrees.y -= event.relative.x * MouseSensetivityInGame.GetMouseSens()
	
		_player.rotation_degrees.x = clamp(
			_player.rotation_degrees.x - event.relative.y * MouseSensetivityInGame.GetMouseSens(),
			minRotationX,
			maxRotationX
		)

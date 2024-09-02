extends Node3D

class_name MouseLook

@export var _player: CharacterBody3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_player.rotation_degrees.y -= event.relative.x * MouseSensetivityInGame.GetMouseSens()
		

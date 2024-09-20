extends Node

class_name PlayerReloadInput

static func GetReloadInput() -> bool:
	return Input.is_action_just_pressed("PlayerReload")

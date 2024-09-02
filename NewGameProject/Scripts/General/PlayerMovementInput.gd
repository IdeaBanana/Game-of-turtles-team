extends Node

class_name PlayerMovementInput

static func GetMoveInput() -> Vector2:
	return Input.get_vector("PlayerMoveLeft", "PlayerMoveRight", "PlayerMoveForwards", "PlayerMoveBackwards")

static func GetSprintInput() -> bool:
	return Input.is_action_pressed("PlayerSprint")

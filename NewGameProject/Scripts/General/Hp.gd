@icon("res://Assets/Arts/Nodes/HP.png")
extends Node

class_name Hp

@export var _parent: Node3D
@export var healthPoint: float = 100.0

signal Damaged
signal Died

func ApplyDamage(damage: float):
	healthPoint -= damage
	Damaged.emit()
	if CheckAndGetIsDeath():
		ApplyDeath()

func CheckAndGetIsDeath() -> bool:
	if healthPoint <= 0.0:
		return true
	return false

func ApplyDeath() -> void:
	Died.emit()
	_parent.queue_free()

func GetRemainingPoints() -> float:
	return healthPoint

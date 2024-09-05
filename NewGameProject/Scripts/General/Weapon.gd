extends Area3D

class_name Weapon

@export_group("Attack settings")
@export var constAttackDamage: float = 0.0

signal AttackStarted
signal AttackFinished

func StartFire() -> void:
	pass

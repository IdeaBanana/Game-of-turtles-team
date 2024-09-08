extends Area3D

class_name Weapon

@export var weaponDependencyContainer: WeaponDependencyContainer

@export_group("Attack settings")
@export var constAttackDamage: float = 0.0

signal AttackStarted
signal AttackFinished

func StartFire() -> void:
	pass

func StartAdditionalFire() -> void:
	pass

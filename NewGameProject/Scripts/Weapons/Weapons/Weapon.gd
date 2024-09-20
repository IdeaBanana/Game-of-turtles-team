extends Area3D

class_name Weapon

@export var _weaponContainer: WeaponDependencyContainer

@export_group("Attack settings")
@export var constAttackDamage: float = 0.0
@export var minAttackDamage: float
@export var maxAttackDamage: float

signal AttackStarted
signal AttackEnded

func StartFire() -> void:
	pass

func StartAdditionalFire() -> void:
	pass

func ConnectAttackSignals(start: Callable, end: Callable) -> void:
	AttackStarted.connect(start)
	AttackEnded.connect(end)

func _OnAttackStarted() -> void:
	pass

func _OnAttackEnded() -> void:
	pass

func GetMinAttackDamage() -> float:
	return minAttackDamage

func GetMaxAttackDamage() -> float:
	return maxAttackDamage

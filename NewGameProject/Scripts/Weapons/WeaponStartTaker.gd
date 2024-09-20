extends Node3D

class_name CurrentWeaponSetter

@export var _weaponContainer: RangedWeaponDependencyContainer

func _ready() -> void:
	get_tree().get_first_node_in_group("CurrentSelectedWeaponContainer").SetCurrentWeaponContainer(_weaponContainer)

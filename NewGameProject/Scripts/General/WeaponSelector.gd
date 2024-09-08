extends Node3D

class_name CurrentWeaponSetter

@export var dependencyContainer: RangedWeaponDependencyContainer

func _ready() -> void:
	var currentSelectedWeaponContainer: PlayerWeaponSelector = get_tree().get_first_node_in_group("CurrentSelectedWeaponContainer")
	currentSelectedWeaponContainer.SetCurrentWeaponContainer(dependencyContainer)

extends Node3D

class_name PlayerWeaponSelector

@export var currentWeaponContainer: WeaponDependencyContainer

signal WeaponChanged(prevWeaponContainer, nextWeaponContainer)

func SetCurrentWeaponContainer(newWeaponContainer: RangedWeaponDependencyContainer):
	emit_signal("WeaponChanged", currentWeaponContainer, newWeaponContainer)
	currentWeaponContainer = newWeaponContainer

func GetCurrentWeaponContainer() -> RangedWeaponDependencyContainer:
	return currentWeaponContainer

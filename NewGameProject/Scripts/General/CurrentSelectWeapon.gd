extends Node3D

class_name WeaponSelecter

@export var currentWeaponContainer: WeaponDependencyContainer

signal WeaponChanged(prevWeaponContainer, nextWeaponContainer)

func SetCurrentWeaponContainer(newWeaponContainer: WeaponDependencyContainer):
	emit_signal("WeaponChanged", currentWeaponContainer, newWeaponContainer)
	currentWeaponContainer = newWeaponContainer

func GetCurrentWeaponContainer() -> WeaponDependencyContainer:
	return currentWeaponContainer

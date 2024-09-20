extends Node3D

class_name PlayerWeaponSelector

@export var currentWeaponContainer: WeaponDependencyContainer

signal WeaponChanged(prevWeaponContainer, nextWeaponContainer)

#region Get Set
## Не обязательно Ranged.
func SetCurrentWeaponContainer(newWeaponContainer: WeaponDependencyContainer):
	emit_signal("WeaponChanged", currentWeaponContainer, newWeaponContainer)
	currentWeaponContainer = newWeaponContainer

## Не обязательно Ranged.
func GetCurrentWeaponContainer() -> WeaponDependencyContainer:
	return currentWeaponContainer
#endregion

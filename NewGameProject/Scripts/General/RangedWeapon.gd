extends Weapon

class_name RangedWeapon

@export var weaponDependencyContainer: WeaponDependencyContainer

@export_group("Ranged weapon settings")
@export var maxPunchedEnemiesValue: int

func GetMaxPunchedEnemiesValue() -> int:
	return maxPunchedEnemiesValue

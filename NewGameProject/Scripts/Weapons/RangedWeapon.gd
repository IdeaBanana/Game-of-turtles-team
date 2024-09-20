extends Weapon

class_name RangedWeapon

@export_group("Ranged weapon settings")
@export var maxShotDistance: float = 100.0
@export var scatter: float = 20.0

func GetScatter() -> float:
	return scatter

func GetMaxShotDistance() -> float:
	return maxShotDistance

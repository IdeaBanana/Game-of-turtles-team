extends Weapon

class_name RangedWeapon


@export_group("Ranged weapon settings")
@export var minAttackDamage: float
@export var maxAttackDamage: float

@export var maxShotDistance: float = 100.0

@export var scatter: float = 20.0

func GetScatter() -> float:
	return scatter

func GetMinDamage() -> float:
	return minAttackDamage

func GetMaxDamage() -> float:
	return maxAttackDamage

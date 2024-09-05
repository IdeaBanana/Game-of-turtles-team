extends Weapon

class_name RangedWeapon

@export var weaponDependencyContainer: WeaponDependencyContainer

@export_group("Ranged weapon settings")
@export var maxPunchedEnemiesValue: int

@export var minAttackDamage: float
@export var maxAttackDamage: float

@export var maxShotDistance: float = 100.0

@export var scatter: float = 20.0

func GetScatter() -> float:
	return scatter

func GetMaxPunchedEnemiesValue() -> int:
	return maxPunchedEnemiesValue

func GetMinDamage() -> float:
	return minAttackDamage

func GetMaxDamage() -> float:
	return maxAttackDamage

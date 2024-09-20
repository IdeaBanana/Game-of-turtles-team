extends WeaponDependencyContainer

class_name RangedWeaponDependencyContainer

@export var rayCast: EnemyFinder 
@export var weaponAmmunition: WeaponAmmunition
@export var weaponMagazineReloader: WeaponMagazineReloader

#region Get
func GetWeaponMagazineReloader() -> WeaponMagazineReloader:
	return weaponMagazineReloader

func GetWeaponAmmunition() -> WeaponAmmunition:
	return weaponAmmunition

func GetEnemyFinder() -> EnemyFinder:
	return rayCast
#endregion

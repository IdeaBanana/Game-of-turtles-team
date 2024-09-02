extends Node3D

class_name DamageCalculator

@export var _weaponContainer: WeaponDependencyContainer

func CalculateDamageFromDistance(distance: float) -> float:
	var minDamage: float = _weaponContainer.GetWeapon().GetMinDamage()
	var maxDamage: float = _weaponContainer.GetWeapon().GetMaxDamage()
	var damage = lerp(minDamage, minDamage, maxDamage)
	return clampf(damage, minDamage, maxDamage)

extends Node3D

class_name DamageCalculator

static func CalculateDamageFromDistance(minDamage:float, maxDamage: float, distance: float, maxDistance: float) -> float:
	var damage: float
	damage = lerp(maxDamage, minDamage, distance / maxDistance)
	return clampf(damage, minDamage, maxDamage)

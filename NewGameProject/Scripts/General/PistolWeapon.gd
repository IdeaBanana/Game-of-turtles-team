extends RangedWeapon

class_name PistolWeapon

func StartFire() -> void:
	var allCollisionsForAttack: Array = weaponDependencyContainer.GetCollisiionFinder().GetAvaiableCollisions().filter(
		func(area):
			if area is DamageablePartBody3D:
				return area)
	var avaiableCollisionsForAttack: Array = allCollisionsForAttack.filter(
		func(coll):
			if allCollisionsForAttack.find(coll) < 2:
				return coll)
	
	print(allCollisionsForAttack)
	

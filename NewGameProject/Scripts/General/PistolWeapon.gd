extends RangedWeapon

class_name SimpleShootWeapon

func StartFire() -> void:
	var rayCast := rangedWeaponDependencyContainer.GetRayCastEnemyDetector()
	
	var enemy := rayCast.CheckEnemy()
	if enemy:
		var enemyHp := enemy.GetHpNode()
		var damage := DamageCalculator.CalculateDamageFromDistance(
			minAttackDamage, maxAttackDamage,
			rangedWeaponDependencyContainer.global_position.distance_to(enemy.global_position),
			maxShotDistance
			)
		enemyHp.ApplyDamage(damage)

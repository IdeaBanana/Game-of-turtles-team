extends RangedWeapon

class_name PistolWeapon

func StartFire() -> void:
	# Применяем разброс
	weaponDependencyContainer.GetCollisiionFinder().UpdateCurrentlyWeaponDirectionWithScatter(GetScatter())
# 1. DamageablePartBody3D. 2. Все возможные враги.
	var allCollisionsForAttack: Array = weaponDependencyContainer.GetCollisiionFinder().GetAvaiableCollisions().filter(
		func(collision):
			if collision is DamageablePartBody3D:
				return collision)
	var allEnemies: Array = weaponDependencyContainer.GetCollisiionFinder().GetAvaiableCollisions().filter(
		func(body):
			if body is EnemyParent:
				return body)
	
# Тут делаем хитрость: это возвращает какое-нибудь значения, но можно с помощью этого метода (map) вызвать еще 
	allEnemies.map(
		func(enemy):
			var index := allEnemies.find(enemy)
			if index < maxPunchedEnemiesValue:
				var damage := weaponDependencyContainer.GetDamageCalculator().CalculateDamageFromDistance(
					minAttackDamage, maxAttackDamage, allCollisionsForAttack[index].GetDamageOnPart(),
					weaponDependencyContainer.GetWeapon().global_transform.origin.distance_to(enemy.global_transform.origin), 
					maxShotDistance)
				enemy.GetHpNode().ApplyDamage(damage)
				return enemy)

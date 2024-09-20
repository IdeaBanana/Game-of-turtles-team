extends RangedWeapon

class_name RainbowLaserWeapon

func StartFire() -> void:
	var enemyFinder: EnemyFinderMultiple = weaponDependencyContainer.GetEnemyFinder()
	enemyFinder.UpdateCurrentlyWeaponDirection()

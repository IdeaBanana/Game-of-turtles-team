extends RangedWeapon

class_name SimpleShootWeapon

func StartFire() -> void:
	if !HaveBulletsInMagazine():
		return
	
	if WeaponAmmunitionIsEmpty():
		return
	
	AttackStarted.emit()
	ApplyDamageToEnemy()
	AttackEnded.emit()

func ApplyDamageToEnemy() -> void:
	var rayCast: EnemyFinderSingle = _weaponContainer.GetEnemyFinder()
	
	var enemy: EnemyParent = rayCast.GetAvailableEnemies()
	if enemy:
		var enemyHp := enemy.GetHpNode()
		var damage := DamageCalculator.CalculateDamageFromDistance(
			minAttackDamage, maxAttackDamage,
			_weaponContainer.global_position.distance_to(enemy.global_position),
			maxShotDistance)
		
		enemyHp.ApplyDamage(damage)

func HaveBulletsInMagazine() -> bool:
	if _weaponContainer.GetWeaponAmmunition().MagazineIsEmpty():
		if _weaponContainer.GetWeaponAmmunition().allMagazines.size() > 1:
			_weaponContainer.GetWeaponMagazineReloader().ReloadNeeded.emit()
		return false
	return true

func WeaponAmmunitionIsEmpty() -> bool:
	if _weaponContainer.GetWeaponAmmunition().allMagazines.size() <= 1 and _weaponContainer.GetWeaponAmmunition().GetCurrentMagazine().GetAmmoValue() <= 0:
		return true
	return false

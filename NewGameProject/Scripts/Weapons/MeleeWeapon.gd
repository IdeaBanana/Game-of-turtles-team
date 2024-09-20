extends Weapon

class_name MeleeWeapon

func GetOverlappingEnemies() -> Array[EnemyParent]:
	var enemies: Array[EnemyParent]
	for body in get_overlapping_bodies():
		if body not in enemies and body is EnemyParent:
			enemies.append(body)
	return enemies

func ApplyDamageToEnemiesArray(enemies: Array[EnemyParent], damage: float) -> void:
	for enemy in enemies:
		enemy.GetHpNode().ApplyDamage(damage)

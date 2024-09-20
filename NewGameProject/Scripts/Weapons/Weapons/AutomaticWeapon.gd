extends SimpleShootWeapon

class_name AutomaticShootWeapon

@export var timeBetweenAttack: float = 0.15

func StartFire() -> void:
	if CheckMagazineAndBulletsInWeapon():
		return
	
	AttackStarted.emit()
	ApplyDamageToEnemy()
	await get_tree().create_timer(timeBetweenAttack).timeout
	AttackEnded.emit()

extends WeaponInput

func GetStartFireInput() -> bool:
	return Input.is_action_just_pressed("PlayerShoot")

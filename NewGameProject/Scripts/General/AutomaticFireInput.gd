extends WeaponInput

class_name AutomaticWeaponInput

func GetStartFireInput() -> bool:
	return Input.is_action_pressed("PlayerShoot")

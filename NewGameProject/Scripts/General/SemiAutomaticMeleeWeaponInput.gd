extends AdditionalFireWeaponInput

class_name AdditionalSemiAutomaticFireWeaponInput

func GetStartFireInput() -> bool:
	return Input.is_action_just_pressed("AdditionalShoot")

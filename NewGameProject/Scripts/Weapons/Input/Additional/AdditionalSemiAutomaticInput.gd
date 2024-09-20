extends AdditionalWeaponInput

class_name AdditionalSemiAutomaticWeaponInput

func GetStartFireInput() -> bool:
	return Input.is_action_just_pressed("AdditionalShoot")

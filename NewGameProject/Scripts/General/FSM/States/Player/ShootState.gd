extends State

class_name AttackState

@export var _weaponSelector: PlayerWeaponSelector

func Attack() -> void:
	_weaponSelector.GetCurrentWeaponContainer().GetWeapon().StartFire()

func AdditionalAttack() -> void:
	_weaponSelector.GetCurrentWeaponContainer().GetWeapon().StartAdditionalFire()

extends State

class_name AttackState

@export var stateKeeper: AttackKeeper
@export var currentSelectWeaponControler: WeaponSelecter

func Attack() -> void:
	currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeapon().StartFire()

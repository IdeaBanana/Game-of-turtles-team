extends State

class_name AttackState

@export var stateKeeper: AttackKeeper
@export var currentSelectWeaponControler: PlayerWeaponSelector

func Attack() -> void:
	currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeapon().StartFire()

func AdditionalAttack() -> void:
	currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeapon().StartAdditionalFire()

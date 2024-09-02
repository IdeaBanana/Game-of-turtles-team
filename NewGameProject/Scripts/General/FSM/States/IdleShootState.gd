extends State

class_name IdleShootState

@export var _stateKeeper: AttackKeeper
@export var currentSelectWeaponControler: WeaponSelecter

func FixedUpdate(delta: float) -> void:
	if currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeaponAttackInput().GetStartFireInput():
		TransitionToOtherState(_stateKeeper.GetAttackState())

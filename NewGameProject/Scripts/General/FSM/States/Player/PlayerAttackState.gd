extends AttackState

class_name PlayerAttackState

func Enter() -> void:
	Attack()

func FixedUpdate(delta: float) -> void:
	if currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeaponAttackInput().GetStartFireInput():
		Attack()
	else:
		TransitionToOtherState(stateKeeper.GetIdleState())

extends AttackState

class_name PlayerAttackState

var startedSimpleAttack: bool
var startedAdditionalAttack: bool

func StartFromSimpleAttack(simpleAttack: bool):
	startedSimpleAttack = simpleAttack
	startedAdditionalAttack = not simpleAttack

func Enter() -> void:
	if startedSimpleAttack:
		Attack()
	elif startedAdditionalAttack:
		AdditionalAttack()

func FixedUpdate(delta: float) -> void:
	if currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeaponAttackInput().GetStartFireInput():
		Attack()
	else:
		TransitionToOtherState(stateKeeper.GetIdleState())
	
	if currentSelectWeaponControler.GetCurrentWeaponContainer().HasAdditionalAttackInput():
		if currentSelectWeaponControler.GetCurrentWeaponContainer().GetAdditionalWeaponAttackInput().GetStartFireInput():
			AdditionalAttack()

extends State

class_name IdleShootState

@export var _stateKeeper: AttackKeeper
@export var currentSelectWeaponControler: PlayerWeaponSelector

func FixedUpdate(delta: float) -> void:
	if currentSelectWeaponControler.GetCurrentWeaponContainer() and currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeapon():
		if currentSelectWeaponControler.GetCurrentWeaponContainer().GetWeaponAttackInput().GetStartFireInput():
			_stateKeeper.GetAttackState().StartFromSimpleAttack(true)
			TransitionToOtherState(_stateKeeper.GetAttackState())
 
	if currentSelectWeaponControler.GetCurrentWeaponContainer().HasAdditionalAttackInput():
		if currentSelectWeaponControler.GetCurrentWeaponContainer().GetAdditionalWeaponAttackInput().GetStartFireInput():
			_stateKeeper.GetAttackState().StartFromSimpleAttack(false)
			TransitionToOtherState(_stateKeeper.GetAttackState())

extends State

class_name ChangeWeaponState

@export var _stateKeeper: AttackKeeper
@export var _weaponSelector: PlayerWeaponSelector

## Будем ждать окончание ани
func Enter() -> void:
	TransitionToOtherState(_stateKeeper.GetIdleState())

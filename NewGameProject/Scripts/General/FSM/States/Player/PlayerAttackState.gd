extends AttackState

class_name PlayerAttackState

@export var _stateKeeper: AttackKeeper

# Определение начальной атаки
var _startedSimpleAttack: bool = true

func StartFromSimpleAttack(simpleAttack: bool):
	_startedSimpleAttack = simpleAttack

func Enter() -> void:
	if _weaponSelector.GetCurrentWeaponContainer() is RangedWeaponDependencyContainer:
		_weaponSelector.GetCurrentWeaponContainer().GetWeaponMagazineReloader().ReloadNeeded.connect(_OnReloadNeeded)
		_weaponSelector.GetCurrentWeaponContainer().GetWeapon().AttackEnded.connect(TransitionToOtherState.bind(_stateKeeper.GetIdleState()))

	if _startedSimpleAttack:
		await Attack()
		TransitionToOtherState(_stateKeeper.GetIdleState())
	else:
		await AdditionalAttack()
		TransitionToOtherState(_stateKeeper.GetIdleState())

func Exit() -> void:
	if _weaponSelector.GetCurrentWeaponContainer() is RangedWeaponDependencyContainer:
		_weaponSelector.GetCurrentWeaponContainer().GetWeaponMagazineReloader().ReloadNeeded.disconnect(_OnReloadNeeded)
		_weaponSelector.GetCurrentWeaponContainer().GetWeapon().AttackEnded.disconnect(TransitionToOtherState.bind(_stateKeeper.GetIdleState()))

## При перезарядки оружия
func _OnReloadNeeded() -> void:
	TransitionToOtherState(_stateKeeper.GetReloadState())

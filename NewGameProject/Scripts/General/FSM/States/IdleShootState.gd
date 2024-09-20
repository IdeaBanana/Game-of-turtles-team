extends State

class_name IdleShootState

@export var _weaponSelector: PlayerWeaponSelector
@export var _attackKeeper: AttackKeeper

func FixedUpdate(delta: float) -> void:
	if _weaponSelector.GetCurrentWeaponContainer() is RangedWeaponDependencyContainer:
		if _weaponSelector.GetCurrentWeaponContainer().GetWeaponMagazineReloader().NeedReload():
			TransitionToOtherState(_attackKeeper.GetReloadState())
	
	if _weaponSelector.GetCurrentWeaponContainer().GetWeaponAttackInput().GetStartFireInput():
		_attackKeeper.GetAttackState().StartFromSimpleAttack(true)
		TransitionToOtherState(_attackKeeper.GetAttackState())
	
	if _weaponSelector.GetCurrentWeaponContainer().HasAdditionalAttackInput():
		if _weaponSelector.GetCurrentWeaponContainer().GetAdditionalWeaponAttackInput().GetStartFireInput():
			_attackKeeper.GetAttackState().StartFromSimpleAttack(false)
			TransitionToOtherState(_attackKeeper.GetAttackState())

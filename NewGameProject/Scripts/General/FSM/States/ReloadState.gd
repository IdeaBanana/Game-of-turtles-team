extends State

class_name ReloadState

@export var _stateKeeper: AttackKeeper
@export var _weaponSelector: PlayerWeaponSelector

var needAttackState: bool

func Enter() -> void:
	Reload()

func Reload() -> void:
	var magazineReloader := _weaponSelector.GetCurrentWeaponContainer().GetWeaponMagazineReloader() as WeaponMagazineReloader
	# Если перезаряжаемся то не надо заново.
	if magazineReloader.isReload:
		return
	# Ждем перезарядки магазина.
	await magazineReloader.Reload()
	TransitionToOtherState(_stateKeeper.GetIdleState())

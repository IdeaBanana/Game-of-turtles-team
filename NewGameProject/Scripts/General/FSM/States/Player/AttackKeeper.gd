extends StateKeeper

class_name AttackKeeper

@export var reloadState: ReloadState
@export var attackState: AttackState
@export var idleState: IdleShootState

func GetReloadState() -> ReloadState:
	return reloadState

func GetAttackState() -> AttackState:
	return attackState

func GetIdleState() -> IdleShootState:
	return idleState

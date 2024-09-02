extends StateKeeper

class_name PlayerMovementStateKeeper

@export var walkState: PlayerWalkState
@export var sprintState: PlayerSprintState
@export var stayState: StayState
@export var dashState: DashState

func GetWalkState() -> PlayerWalkState:
	return walkState

func GetSprintState() -> PlayerSprintState:
	return sprintState

func GetStayState() -> StayState:
	return stayState

func GetDashState() -> DashState:
	return dashState

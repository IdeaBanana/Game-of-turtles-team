extends State

class_name StayState

@export var stateKeeper: PlayerMovementStateKeeper

func FixedUpdate(delta: float) -> void:
	if PlayerMovementInput.GetMoveInput():
		TransitionToOtherState(stateKeeper.GetWalkState())
	elif PlayerMovementInput.GetMoveInput() and PlayerMovementInput.GetMoveInput():
		TransitionToOtherState(stateKeeper.GetSprintState())

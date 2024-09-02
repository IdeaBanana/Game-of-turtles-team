extends PlayerMovementState

class_name PlayerWalkState

func FixedUpdate(delta: float) -> void:
	super.FixedUpdate(delta)
	if PlayerMovementInput.GetSprintInput():
		TransitionToOtherState(stateKeeper.GetSprintState())

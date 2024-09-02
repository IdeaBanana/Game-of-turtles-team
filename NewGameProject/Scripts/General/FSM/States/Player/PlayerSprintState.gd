extends PlayerMovementState

class_name PlayerSprintState

func FixedUpdate(delta: float) -> void:
	super.FixedUpdate(delta)
	if !PlayerMovementInput.GetSprintInput():
		TransitionToOtherState(stateKeeper.GetWalkState())

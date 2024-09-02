extends State

class_name PlayerMovementState

@export var stateKeeper: PlayerMovementStateKeeper
@export var _parent: CharacterBody3D

@export_group("Movement settings")
@export var initialSpeed: float = 5.0
@export var slideMultiplier: float = 2.0

var prevSpeed: float
var currentSpeed: float 

var hasPrevSpeed: bool

func Enter() -> void:
	currentSpeed = initialSpeed

func FixedUpdate(delta: float) -> void:
	var inputDirection := PlayerMovementInput.GetMoveInput()
	var vectorDirection := (_parent.transform.basis * Vector3(inputDirection.x, 0, inputDirection.y)).normalized()
	
	if vectorDirection != Vector3.ZERO:
		if hasPrevSpeed:
			currentSpeed = prevSpeed
			hasPrevSpeed = false
		MoveToDirection(vectorDirection)
	else:
		if !hasPrevSpeed:
			prevSpeed = currentSpeed
			hasPrevSpeed = true
		ApplySliding(delta)
		if CanTransitionToStayState():
			TransitionToOtherState(stateKeeper.GetStayState())
		
	_parent.move_and_slide()

func MoveToDirection(direction: Vector3) -> void:
	_parent.velocity.x = direction.x * currentSpeed
	_parent.velocity.z = direction.z * currentSpeed

func ApplySliding(delta: float) -> void:
	currentSpeed = lerp(currentSpeed, 0.0, slideMultiplier * delta)
	_parent.velocity.x = lerp(_parent.velocity.x, 0.0, slideMultiplier * delta)
	_parent.velocity.z = lerp(_parent.velocity.z, 0.0, slideMultiplier * delta)
	
	if currentSpeed < 0.1:
		currentSpeed = 0
		_parent.velocity.x = 0.0
		_parent.velocity.z = 0.0

func CanTransitionToStayState() -> bool:
	return _parent.velocity == Vector3.ZERO

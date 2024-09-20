@icon("res://Assets/Arts/Nodes/FSM.png")
extends Node3D

class_name StateMachine

@export var initializeState: State

var allStates: Dictionary = {}

var currentState: State

func _ready() -> void:
	InitializeAllChildStates()
	ApplyInitialState()
	if currentState:
		currentState.Enter()

func ApplyInitialState() -> void:
	if initializeState:
		currentState = initializeState

func InitializeAllChildStates(selfStates: Array = get_children()) -> void:
	for child in selfStates:
		if child is State:
			allStates[child] = child
			child.Transitioned.connect(_OnTransitioned)

func _OnTransitioned(newState: State) -> void:
	if currentState:
		currentState.Exit()
	currentState = allStates[newState]
	currentState.Enter()

func _process(delta: float) -> void:
	if currentState:
		currentState.Update(delta)

func _physics_process(delta: float) -> void:
	if currentState:
		currentState.FixedUpdate(delta)

func GetCurrentState() -> State:
	return currentState

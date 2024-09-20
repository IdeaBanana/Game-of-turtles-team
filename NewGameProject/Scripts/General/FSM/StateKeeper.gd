@icon("res://Assets/Arts/Nodes/K.png")
extends Node3D

class_name StateKeeper

@export var stateMachine: StateMachine

func GetStateMachine() -> StateMachine:
	return stateMachine

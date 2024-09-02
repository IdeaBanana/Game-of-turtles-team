@icon("res://Assets/Arts/Nodes/ST.png")
extends Node3D

class_name State

signal Transitioned

func Enter() -> void:
	pass

func Update(delta: float) -> void:
	pass

func FixedUpdate(delta: float) -> void:
	pass

func Exit() -> void:
	pass

func TransitionToOtherState(state: State):
	Transitioned.emit(state)

extends Node3D

class_name Shaker

@export var _object: Node3D

@export_group("Shakes")
const SMALLSHAKE: float = 0.01
const MEDIUMSHAKE: float = 0.05
const BIGSHAKE: float = 0.1
@export var _shakeFade: float = 5.0
@export var _shakeStrength: float

func ApplyShake(newStrength: float):
	_shakeStrength = newStrength

func _process(delta: float) -> void:
	if !_object:
		return
	LerpShakeToZero(delta)
	ApplyShakeToShakedObjectProperties()

func ApplyShakeToShakedObjectProperties() -> void:
	pass

func LerpShakeToZero(delta: float) -> void:
	if _shakeStrength > 0:
		_shakeStrength = lerpf(_shakeStrength, 0, _shakeFade * delta)

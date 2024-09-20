extends Shaker

class_name CameraShaker

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		ApplyShake(MEDIUMSHAKE)

func ApplyShakeToShakedObjectProperties() -> void:
	_object.h_offset = randf_range(-_shakeStrength, _shakeStrength)
	_object.v_offset = randf_range(-_shakeStrength, _shakeStrength)

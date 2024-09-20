extends Shaker

class_name ObjectShaker

func ApplyShakeToShakedObjectProperties() -> void:
	_object.global_transform.origin = Vector3(
		randf_range(-_shakeStrength, _shakeStrength),
		randf_range(-_shakeStrength, _shakeStrength),
		randf_range(-_shakeStrength, _shakeStrength)
	)

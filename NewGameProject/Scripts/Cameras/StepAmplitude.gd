extends Camera3D

@export var _parent: CharacterBody3D
@export var _head: Node3D

@export_subgroup("Steps")
@export var stepFrequency: float = 2
@export var stepAmplitude: float = 0.2
var sinTime: float = 0.0

func _physics_process(delta: float) -> void:
	ApplyStepAmplitude(delta)

func ApplyStepAmplitude(delta: float) -> void:
	sinTime += delta * _parent.velocity.length()
	_head.transform.origin = GetPositionSinChart(sinTime)

func GetPositionSinChart(time: float) -> Vector3:
	var sinPos := Vector3.ZERO
	sinPos.y = sin(time * stepFrequency) * stepAmplitude
	sinPos.x = cos(time * stepFrequency / 2) * stepAmplitude
	return sinPos

extends MeleeWeapon

class_name ChainsawWeapon

@export var damageUpStep: float = 1.0
var gainDamage: float = 0.0

@export_group("Rotation settings")
@export var upRotationSpeed: float = 1.0
@export var downRotationSpeed: float = 0.25
@export var maxDegrees: float = 60.0
var originRotation: Vector3

var _mouseCameraObserver: MouseLook
var _player: Node3D
var _shaker: Shaker = Shaker.new()

var isAttacking: bool = false
var tween: Tween

func _ready() -> void:
	add_child(_shaker)
	_mouseCameraObserver = get_tree().get_first_node_in_group("MouseCameraObserver")
	_player = get_tree().get_first_node_in_group("Player")
	ConnectAttackSignals(_OnAttackStarted, _OnAttackEnded)

func StartFire() -> void:
	if !isAttacking:
		_mouseCameraObserver.set_process_input(false)
		originRotation = _player.rotation_degrees
		isAttacking = true
		LiftUpAnimation()
	if isAttacking:
		if gainDamage < maxAttackDamage:
			gainDamage += damageUpStep
			for enemy in GetOverlappingEnemies():
				var shaker = weaponDependencyContainer.GetShaker()
				shaker._object = GetOverlappingEnemies()[0]
				shaker.ApplyShake(Shaker.BIGSHAKE)
		
		ApplyDamageToEnemiesArray(GetOverlappingEnemies(), damageUpStep)

func LiftUpAnimation() -> void:
	if tween:
		tween.stop() # Остановить все текущие твины перед началом новой анимации

	tween = create_tween()
	var finalValue := originRotation.x + maxDegrees
	tween.tween_property(_player, "rotation_degrees:x", finalValue, upRotationSpeed).set_ease(Tween.EASE_IN)

func LiftDownAnimation() -> void:
	if tween:
		tween.stop() # Остановить все текущие твины перед началом новой анимации

	tween = create_tween()
	tween.tween_property(_player, "rotation_degrees:x", originRotation.x, downRotationSpeed).set_ease(Tween.EASE_IN)
	tween.finished.connect(_OnLiftDownAnimationFinished)

func _OnLiftDownAnimationFinished() -> void:
	isAttacking = false
	_mouseCameraObserver.set_process_input(true)

func _OnAttackStarted() -> void:
	if not isAttacking:
		StartFire()

func _OnAttackEnded() -> void:
	if isAttacking:
		LiftDownAnimation()

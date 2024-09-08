extends MeleeWeapon

class_name KatanaWeapon

@export_group("Additional settings")
@export var additionalStartAnimationRotationDegrees: float = -90.0
@export var additionalEndAnimationRotationDegrees: float = 90.0
@export var rotationDegreesFromToOriginPositionTime: float = 0.4
@export var slowSpeed: float = 7.5
@export var fastSpeed: float = 15.0

var player: Node3D
var originRotationDegrees: float
var startRotationDegrees: float
var endRotationDegrees: float
var currentRotationDegrees: float
var movingForward: bool = true
var speed: float
var isAnimating: bool = false
var isReturningToOrigin: bool = false  # Флаг для возврата в исходное положение

func _ready():
	player = get_tree().get_first_node_in_group("Player")

func StartFire() -> void:
	var allAvaiableEnemies: Array[EnemyParent] = []
	for body in get_overlapping_bodies():
		if body is EnemyParent:
			allAvaiableEnemies.append(body)
	for enemy in allAvaiableEnemies:
		enemy.GetHpNode().ApplyDamage(constAttackDamage)

func StartAdditionalFire() -> void:
	if isAnimating:
		return

	if player == null:
		player = get_tree().get_first_node_in_group("Player")

	originRotationDegrees = player.global_rotation_degrees.y

	var random_direction: int = randi() % 2  # Генерация случайного числа (0 или 1)
	
	if random_direction == 0:
		# Вращение слева направо
		startRotationDegrees = originRotationDegrees + additionalStartAnimationRotationDegrees
		endRotationDegrees = originRotationDegrees + additionalEndAnimationRotationDegrees
	else:
		# Вращение справа налево
		startRotationDegrees = originRotationDegrees + additionalEndAnimationRotationDegrees
		endRotationDegrees = originRotationDegrees + additionalStartAnimationRotationDegrees

	currentRotationDegrees = originRotationDegrees
	movingForward = true
	speed = slowSpeed
	isAnimating = true # Запускаем анимацию
	isReturningToOrigin = false # Начинаем с основной анимации

func _process(delta: float):
	if not isAnimating:
		return

	if isReturningToOrigin:
		# Возвращаемся в исходное положение
		currentRotationDegrees = lerp(currentRotationDegrees, originRotationDegrees, delta * slowSpeed)
		if abs(currentRotationDegrees - originRotationDegrees) < 0.5:
			isAnimating = false  # Останавливаем анимацию после возвращения
	else:
		# Управляем анимацией вращения
		if movingForward:
			currentRotationDegrees = lerp(currentRotationDegrees, startRotationDegrees, delta * speed)
			if abs(currentRotationDegrees - startRotationDegrees) < 0.5:
				movingForward = false  # Меняем направление
				speed = fastSpeed  # Устанавливаем быструю скорость для обратного движения
		else:
			currentRotationDegrees = lerp(currentRotationDegrees, endRotationDegrees, delta * speed)
			if abs(currentRotationDegrees - endRotationDegrees) < 0.5:
				# Начинаем возвращение в исходное положение
				isReturningToOrigin = true

	# Применяем текущий угол вращения к игроку
	player.global_rotation_degrees.y = currentRotationDegrees

extends MeleeWeapon

class_name ChainsawWeapon

@export_group("Damage settings")
@export var damageUpStep: float = 0.1
@export var gainDamage: float = 0.0

@export_group("Rotation settings")
@export var rotationSpeed: float = 0.01
@export var maxDegrees: float = 60.0
var originDegrees: float

var _player: Node3D
var isAttacking: bool = false

func _ready() -> void:
	_player = get_tree().get_first_node_in_group("Player")

func StartFire() -> void:
	if !isAttacking:
		originDegrees = _player.rotation_degrees.x
		isAttacking = true
	_player.rotation_degrees.x = lerp(_player.rotation_degrees.x, originDegrees + maxDegrees, rotationSpeed)
	

func AssignEnemiesFromOverlappingBodies() -> Array[EnemyParent]:
	var enemies: Array[EnemyParent]
	for enemy in get_overlapping_bodies():
		if enemy is EnemyParent and enemy not in enemies:
			enemies.append(enemy)
	return enemies

extends Node3D

class_name EnemyCollisionFinder

@export var startNodeForMoveRay: Node3D

@export_group("Ray")
@export var rayDistance: float = 1000.0
@export var collideWithAreas: bool = true
@export var collideWithBodies: bool = true

@export_group("Dictionary key")
@export var colliderKey: String = "collider"

var intersectionColliders: Array[CollisionObject3D] = []

func UpdateCurrentlyWeaponDirectionWithScatter(scatter: float = 0.0, num_shots: int = 5):
	var from: Vector3 = startNodeForMoveRay.global_transform.origin
	var base_direction: Vector3 = -startNodeForMoveRay.global_transform.basis.z.normalized()

	# Очистка списка пересечений
	intersectionColliders.clear()

	# Для каждого "патрона" или выстрела
	for i in range(num_shots):
		# Применяем разброс
		var shot_direction = ApplyScatterToDirection(base_direction, scatter)

		# Начальная точка поиска коллизий
		var spaceState = get_world_3d().direct_space_state
		var step = 1.0
		var currentPosition = from

		# Обнаружение коллизий вдоль направления "выстрела"
		while (from - currentPosition).length() < rayDistance:
			var result = spaceState.intersect_point(GetNewQueryPoint(currentPosition))
			for res in result:
				if res.has(colliderKey) and res[colliderKey] not in intersectionColliders:
					intersectionColliders.append(res[colliderKey])
			currentPosition += shot_direction * step  # Двигаемся дальше по лучу

# Функция для применения случайного разброса к направлению
func ApplyScatterToDirection(direction: Vector3, scatter: float) -> Vector3:
	if scatter <= 0.0:
		return direction

	# Определяем случайные углы отклонения в пределах указанного разброса
	var random_rotation_x = randf_range(-scatter, scatter)
	var random_rotation_y = randf_range(-scatter, scatter)

	# Применяем поворот на основе случайных углов к начальному направлению
	var rotation_matrix = Basis(Vector3(1, 0, 0), deg_to_rad(random_rotation_x))
	rotation_matrix = rotation_matrix.rotated(Vector3(0, 1, 0), deg_to_rad(random_rotation_y))
	
	return (rotation_matrix * direction).normalized()

func GetNewQueryPoint(pos: Vector3, exclude: Array[RID] = [], collWithAreas: bool = true, collWithBodies: bool = true) -> PhysicsPointQueryParameters3D:
	var queryPoint := PhysicsPointQueryParameters3D.new()
	queryPoint.collide_with_areas = collWithAreas
	queryPoint.collide_with_bodies = collWithBodies
	queryPoint.position = pos
	queryPoint.exclude = exclude
	return queryPoint

func GetAvaiableCollisions() -> Array[CollisionObject3D]:
	return intersectionColliders

extends EnemyFinder 
 
class_name EnemyFinderMultiple

@export var target: Node

@export_group("Ray")
@export var rayDistance: float = 1000.0
@export var collideWithAreas: bool = false
@export var collideWithBodies: bool = true

@export_group("Dictionary key")
@export var colliderKey: String = "collider"

var rayQuery: PhysicsRayQueryParameters3D
var intersectionColliders: Array[CollisionObject3D]

func UpdateCurrentlyWeaponDirection():
	var from = target.global_transform.origin
	var direction = -target.global_transform.basis.z.normalized()
	var to = from + direction * rayDistance

	var space_state = get_world_3d().direct_space_state
	var intersections = []

	# Создаем новый RayQuery
	var query = PhysicsRayQueryParameters3D.new()
	query.from = from
	query.to = to
	query.collide_with_bodies = true
	query.exclude = []

	# Первая проверка на пересечение
	var result = space_state.intersect_ray(query)
	while result.size() > 0:
		intersections.append(result)
		from = result["position"] + direction * 1.0
		query.from = from
		result = space_state.intersect_ray(query)

	# Печатаем все обнаруженные коллизии
	if intersections.size() > 0:
		for intersection in intersections:
			if intersection.has(colliderKey) and !intersection[colliderKey] in intersectionColliders:
				intersectionColliders.append(intersection[colliderKey])
	else:
		intersectionColliders.clear()

func GetAvailableEnemies() -> Array[EnemyParent]:
	var avaiableEnemy: Array[EnemyParent]
	for child in intersectionColliders:
		if child is EnemyParent:
			avaiableEnemy.append(child)
	return avaiableEnemy

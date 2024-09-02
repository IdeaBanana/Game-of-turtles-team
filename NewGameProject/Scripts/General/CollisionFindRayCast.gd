extends Node3D

class_name EnemyCollisionFinder

@export var target: CharacterBody3D

@export_group("Ray")
@export var rayDistance: float = 1000.0
@export var collideWithAreas: bool =  true
@export var collideWithBodies: bool = true

@export_group("Dictionary key")
@export var colliderKey: String = "collider"

var rayQuery: PhysicsRayQueryParameters3D

var intersectionColliders: Array[CollisionObject3D]

func _process(delta: float) -> void:
	UpdateCurrentlyWeaponDirection()

func UpdateCurrentlyWeaponDirection():
	var from = target.global_transform.origin
	var direction = -target.global_transform.basis.z.normalized()
	var to = from + direction * rayDistance

	var space_state = get_world_3d().direct_space_state
	var intersections = []

	rayQuery = PhysicsRayQueryParameters3D.create(from, to)
	rayQuery.collide_with_areas = collideWithAreas
	rayQuery.collide_with_bodies = true
	rayQuery.exclude = []
	
	var result = space_state.intersect_ray(rayQuery)
	while result:
		intersections.append(result)
		from = result.position + direction * 1.0
		rayQuery.from = from
		result = space_state.intersect_ray(rayQuery)

	# Печатаем все обнаруженные коллизии
	if intersections.size() > 0:
		for intersection in intersections:
			if !intersection[colliderKey] in intersectionColliders:
				intersectionColliders.append(intersection[colliderKey])
	else:
		intersectionColliders.clear()

func GetRay() -> PhysicsRayQueryParameters3D:
	return rayQuery

func GetAvaiableCollisions() -> Array[CollisionObject3D]:
	return intersectionColliders

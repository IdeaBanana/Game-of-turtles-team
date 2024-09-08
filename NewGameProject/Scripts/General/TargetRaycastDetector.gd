extends RayCast3D

class_name TargetRaycastDetector

func CheckEnemy() -> EnemyParent:
	if is_colliding():
		if get_collider() is EnemyParent:
			return get_collider()
	return null

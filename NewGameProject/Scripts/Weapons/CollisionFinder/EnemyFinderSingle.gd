extends EnemyFinder

class_name EnemyFinderSingle 

func GetAvailableEnemies() -> EnemyParent:
	if is_colliding():
		if get_collider() is EnemyParent:
			return get_collider()
	return null

extends Node

class_name ObjectPool

var prefab: Node
var availableObjects: Array[Node] = []
var usedObjects: Array[Node] = []

func Init(value: int = 0) -> ObjectPool:
	for i in range(value):
		var instance = prefab.duplicate()
		instance.process_mode = Node.PROCESS_MODE_DISABLED
		availableObjects.append(instance)
	return self

func Get() -> Node:
	var obj: Node
	if availableObjects.size() > 0:
		obj = availableObjects.pop_back()
		obj.process_mode = Node.PROCESS_MODE_INHERIT
		usedObjects.append(obj)
	else:
		obj = Create()
	return obj

func Create() -> Node:
	var new_obj = prefab.duplicate()
	new_obj.process_mode = Node.PROCESS_MODE_INHERIT
	usedObjects.append(new_obj)
	return new_obj

func Release(obj: Node) -> void:
	if obj in usedObjects:
		obj.process_mode = Node.PROCESS_MODE_DISABLED
		usedObjects.erase(obj)
		availableObjects.append(obj)

func SetPrefab(newPrefab: Node) -> ObjectPool:
	prefab = newPrefab
	return self

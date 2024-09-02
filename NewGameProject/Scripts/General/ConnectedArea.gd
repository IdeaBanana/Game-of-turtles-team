extends Area3D

class_name ConnectedArea3D

func _ready() -> void:
	area_entered.connect(_OnObjectEntered)
	body_entered.connect(_OnObjectEntered)
	
	area_exited.connect(_OnObjectExited)
	body_exited.connect(_OnObjectExited)

func _OnObjectEntered(obj) -> void:
	pass

func _OnObjectExited(obj) -> void:
	pass

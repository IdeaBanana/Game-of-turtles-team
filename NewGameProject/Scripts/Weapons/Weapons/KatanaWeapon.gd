extends MeleeWeapon

class_name KatanaWeapon

@export_group("Additional settings")

var player: CharacterBody3D
var mouseLook: MouseLook

func _ready():
	ConnectAttackSignals(_OnAttackStarted, _OnAttackEnded)
	player = get_tree().get_first_node_in_group("Player") as CharacterBody3D
	mouseLook = get_tree().get_first_node_in_group("MouseCameraObserver")

func StartFire() -> void:
	ApplyDamageToEnemiesArray(GetOverlappingEnemies(), constAttackDamage)

func StartAdditionalFire() -> void:
	pass

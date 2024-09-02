extends Node3D

class_name WeaponDependencyContainer

@export var weaponAttackInput: WeaponInput
@export var enemyCollisionFinder: EnemyCollisionFinder
@export var weapon: Weapon
@export var damageCalculator: DamageCalculator

func GetDamageCalculator() -> DamageCalculator:
	return damageCalculator

func GetCollisiionFinder() -> EnemyCollisionFinder:
	return enemyCollisionFinder

func GetWeapon() -> Weapon:
	return weapon

func GetWeaponAttackInput() -> WeaponInput:
	return weaponAttackInput

 

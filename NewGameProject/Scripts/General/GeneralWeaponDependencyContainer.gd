extends Node3D

class_name WeaponDependencyContainer

@export var weapon: Weapon
@export var weaponAttackInput: WeaponInput
@export var additionalWeaponAttackInput: AdditionalFireWeaponInput

func HasAdditionalAttackInput() -> bool:
	return additionalWeaponAttackInput != null

func GetAdditionalWeaponAttackInput() -> AdditionalFireWeaponInput:
	return additionalWeaponAttackInput

func GetWeapon() -> Weapon:
	return weapon

func GetWeaponAttackInput() -> WeaponInput:
	return weaponAttackInput

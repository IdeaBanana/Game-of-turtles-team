extends Node3D

class_name WeaponDependencyContainer

@export var weapon: Weapon
@export var weaponAnimation: WeaponAnimation
@export var weaponAttackInput: WeaponInput
@export var additionalWeaponAttackInput: AdditionalWeaponInput

func GetWeaponAnimation() -> WeaponAnimation:
	return weaponAnimation

func HasAdditionalAttackInput() -> bool:
	return additionalWeaponAttackInput != null

func GetAdditionalWeaponAttackInput() -> AdditionalWeaponInput:
	return additionalWeaponAttackInput

func GetWeapon() -> Weapon:
	return weapon

func GetWeaponAttackInput() -> WeaponInput:
	return weaponAttackInput

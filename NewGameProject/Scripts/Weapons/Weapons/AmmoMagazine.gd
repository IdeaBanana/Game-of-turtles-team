extends Node

class_name WeaponMagazine

@export var currentAmmoValue: int = 0

static func CreateMagazine(ammoValue: int) -> WeaponMagazine:
	var magazine := WeaponMagazine.new()
	magazine.currentAmmoValue = ammoValue
	return magazine

func GetAmmoValue() -> int:
	return currentAmmoValue

func SetAmmoValue(newValue: int) -> void:
	currentAmmoValue = newValue

func SumAmmoValue(sumValue: int) -> void:
	currentAmmoValue += sumValue

func SubtractAmmo(subtractValue: int) -> void:
	currentAmmoValue -= subtractValue

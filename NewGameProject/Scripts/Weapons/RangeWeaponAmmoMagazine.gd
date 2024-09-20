extends Node3D

class_name WeaponAmmunition

@export var _weaponContainer: WeaponDependencyContainer

#region settings
@export_subgroup("Pick up and start game values")
@export var _initialPickUpMagazineValue: int = 2
@export var _initialPickUpBulletValue: int = 30

@export_subgroup("Max values")
@export var maxMagazineInWeaponValue: int = 5
@export var maxBulletInMagazineValue: int = 30
#endregion 

var allMagazines: Array[WeaponMagazine]

#region Initialize
# Начальное создание магазинов у оружия.
func _InitializeMagazinesToWeapon() -> void:
	# Изменяем массив под максимальное количество магазинов.
	allMagazines.resize(_initialPickUpMagazineValue)
	# Создаем новый магазин.
	var magazine := WeaponMagazine.CreateMagazine(_initialPickUpBulletValue)
	# Добавляем копии магазина. Кол-во копий зависит от стартового значения.
	for i in range(allMagazines.size()):
		allMagazines[i] = magazine.duplicate()

# Начальное создание пуль в магазине.
func _InitializeBulletsToMagazines() -> void:
	# Для первого магазина мы задаем определенное количество пуль. Для остальных максимальное количество.
	allMagazines.front().SetAmmoValue(_initialPickUpBulletValue)
	for child in allMagazines:
		if child == null or child == allMagazines.front():
			continue
		child.SetAmmoValue(maxBulletInMagazineValue)
#endregion

func _ready() -> void:
	# Инициализируем пули и магазины.
	_InitializeMagazinesToWeapon()
	_InitializeBulletsToMagazines()

	_weaponContainer.GetWeapon().AttackStarted.connect(_OnWeaponAttacked)

func _OnWeaponAttacked() -> void:
	GetCurrentMagazine().SubtractAmmo(1)

#region Flags Checker
## Проверка на наличие магазинов.
func HaveMagazineInWeapon() -> bool:
	# Если магазин(ы) существет(ют) и он(и) занят(ы), возвращаем true.
	var filteredArray := allMagazines.filter(func(i: WeaponMagazine): if i != null and i.GetAmmoValue() > 0: return i)
	return !filteredArray.is_empty()

func MagazineIsEmpty() -> bool:
	if allMagazines.front():
		return GetCurrentMagazine().GetAmmoValue() <= 0
	return true
#endregion

#region Get Set
func GetAllMagazines() -> Array[WeaponMagazine]:
	return allMagazines

func GetMaxMagazinesValue() -> int:
	return maxMagazineInWeaponValue

func GetMaxBulletsInMagazineValue() -> int:
	return maxBulletInMagazineValue

func GetCurrentMagazine() -> WeaponMagazine:
	return allMagazines.front()
#endregion

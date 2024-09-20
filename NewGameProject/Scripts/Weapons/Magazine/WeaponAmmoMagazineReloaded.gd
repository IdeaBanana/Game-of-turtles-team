extends Node3D

class_name WeaponMagazineReloader

@export var _weaponContainer: WeaponDependencyContainer

@export_group("Reload settings")
@export var reloadTime: float

var isReload: bool = false

var prevWeaponProcessMode: Node.ProcessMode

#region Signals
signal ReloadNeeded
signal ReloadStarted
signal ReloadEnded
#endregion

## Перезарядка
	# Вызываем сигналы, меняем флаги, меняем активность оружия.
	# Между этим мы ждем пока пройдет время перезарядки.
	# В следующий раз будем ждать таймер, с установленным временем анимации перезарядки - часть времени,
	# чтобы перезарядка была раньше анимации.
func Reload() -> void:
	ReloadStarted.emit()
	isReload = true
	DisableWeapon()
	
	await get_tree().create_timer(reloadTime).timeout

	ChangeMagazines()
	EnableWeapon()
	isReload = false
	ReloadEnded.emit()

#region Magazine change
func ChangeMagazines() -> void:
	# Общие переменные для взаимодействия с магазином оружия
	var weaponAmmunition = _weaponContainer.GetWeaponAmmunition() as WeaponAmmunition
	var allMagazines = weaponAmmunition.GetAllMagazines()
	
	var reloadedMagazine := allMagazines.front() as WeaponMagazine
	var lastMagazine := allMagazines.back() as WeaponMagazine
	
	# Если последний магазин полон.
	if lastMagazine.GetAmmoValue() == weaponAmmunition.GetMaxBulletsInMagazineValue():
		if reloadedMagazine.GetAmmoValue() > 0:
			allMagazines.append(reloadedMagazine.duplicate())
		allMagazines.erase(reloadedMagazine)
	
	# Если в последнем магазине патронов меньше максимального.
	elif lastMagazine.GetAmmoValue() < weaponAmmunition.GetMaxBulletsInMagazineValue():
		# Прибавляем все патроны.
		lastMagazine.SumAmmoValue(reloadedMagazine.GetAmmoValue())
		# Берем разницу между уже прибавлеными патронами в магазине и максимальным количеством патронов.
		var restBullet = lastMagazine.GetAmmoValue() - weaponAmmunition.GetMaxBulletsInMagazineValue()
		# Если разница больше ноля.
		if restBullet > 0:
			# Убираем разницу из последнего магазина.
			lastMagazine.SubtractAmmo(restBullet)
			#
			allMagazines.append(reloadedMagazine.duplicate())
		allMagazines.erase(reloadedMagazine)
#endregion 

#region En|Dis able Weapon
## Отключие и возобновление оружия
func DisableWeapon() -> void:
	var weapon := _weaponContainer.GetWeapon()
	if weapon.process_mode != Node.PROCESS_MODE_DISABLED:
		prevWeaponProcessMode = weapon.process_mode
		weapon.process_mode = Node.PROCESS_MODE_DISABLED
func EnableWeapon() -> void:
	_weaponContainer.GetWeapon().process_mode = prevWeaponProcessMode
#endregion

func NeedReload() -> bool:
	var ammunition := _weaponContainer.GetWeaponAmmunition() as WeaponAmmunition
	if ammunition.GetAllMagazines().size() > 1\
	and PlayerReloadInput.GetReloadInput()\
	and ammunition.GetCurrentMagazine().GetAmmoValue() < ammunition.GetMaxBulletsInMagazineValue():
		return true
	return false

#region Get Set
func GetReloadTime() -> float:
	return reloadTime
#endregion

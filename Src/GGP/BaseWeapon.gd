extends Node2D

class_name WeaponBase

onready var cooldown: Timer = $Cooldown

export (PackedScene) var Projectile
export var spread = .15
export var cooldownTime = 0.166
export var RELOAD_TIME = 3
export var MAG_AMMO = 30
export var DRAW_COOLDOWN = 0.5

var currentAmmo = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	cooldown.wait_time = cooldownTime
	currentAmmo = MAG_AMMO
	pass # Replace with function body.

func _shoot():
	if !cooldown.is_stopped() or not Projectile:
		return

	var proj : Projectile = Projectile.instance()
	proj.global_position = self.global_position
	proj.rotation = self.global_rotation + deg2rad(random_spread(spread))
	proj.speed *= 1.0 + random_spread(0.4)
#	proj.shooter = owner

	ObjectRegistry.register_projectile(proj)
	currentAmmo -= 1
	if currentAmmo > 0:
		cooldown.wait_time = cooldownTime * (1.0 + random_spread(0.2))
	else:
		_reload()

	
	cooldown.start()

	pass
	
func _can_reload() -> bool:
	if currentAmmo < MAG_AMMO:
		return true
	else:
		return false
	pass
	
static func random_spread(value: float) -> float:
	var half_spread := value / 2.0
	return rand_range(-half_spread, half_spread)

func _reload():
	cooldown.wait_time = RELOAD_TIME
	print_debug("Reloading")
	currentAmmo = MAG_AMMO
	# TODO: Some feedback for reloading
	pass

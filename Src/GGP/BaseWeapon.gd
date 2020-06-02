extends Node2D

class_name WeaponBase

onready var cooldown: Timer = $Cooldown

export (PackedScene) var Projectile
export var spread = .15
export var cooldownTime = 0.166

# Called when the node enters the scene tree for the first time.
func _ready():
	cooldown.wait_time = cooldownTime
	pass # Replace with function body.

func _shoot(shot_positon : Vector2, shot_orientation : float):
	if !cooldown.is_stopped() or not Projectile:
		return

	var proj : Projectile = Projectile.instance()
	proj.global_position = shot_positon
	proj.rotation = shot_orientation + deg2rad(random_spread(spread))
	proj.speed *= 1.0 + random_spread(0.4)
#	proj.shooter = owner

	ObjectRegistry.register_projectile(proj)
	cooldown.wait_time = cooldownTime * (1.0 + random_spread(0.2))
	cooldown.start()

	pass
	
static func random_spread(value: float) -> float:
	var half_spread := value / 2.0
	return rand_range(-half_spread, half_spread)

func _reload():
	pass

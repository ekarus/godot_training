extends WeaponBase
class_name WeaponShotgun

export (int) var PELLETS_NUM = 4
export (float) var SPREAD_DEG = .5

var pelletRotationStep = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pelletRotationStep = SPREAD_DEG * 2 / PELLETS_NUM
	pass # Replace with function body.

func _shoot():
	if !cooldown.is_stopped() or not Projectile:
		return

	var pelletRotation = -SPREAD_DEG
	
	for i in PELLETS_NUM:
		var proj : Projectile = Projectile.instance()
		proj.global_position = self.global_position
		proj.rotation = self.global_rotation + pelletRotation + deg2rad(random_spread(spread))
		proj.speed *= 1.0 + random_spread(0.4)	
		pelletRotation += pelletRotationStep
	
	#	proj.shooter = owner
		ObjectRegistry.register_projectile(proj)
	
	currentAmmo -= 1
	if currentAmmo > 0:
		cooldown.wait_time = cooldownTime * (1.0 + random_spread(0.2))
	else:
		_reload()
	cooldown.start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

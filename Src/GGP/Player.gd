extends Actor

class_name PlayerActor

# replace this with weapons array

var activeWeapon : WeaponBase

var canShoot = true
onready var cooldown = $ReloadCooldown
enum WEAPON_TYPE {WEAPON_SHOTGUN, WEAPON_RIFLE}

export (WEAPON_TYPE) var DEFAULT_WEAPON = WEAPON_TYPE.WEAPON_RIFLE

signal on_player_shoot

# Called when the node enters the scene tree for the first time.
func _ready():
	_switch_weapon(DEFAULT_WEAPON)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_process_input()
	pass


func _process_input():
	var desiredDirection = Vector2()
	
	if Input.is_action_pressed("player_move_left"):
		desiredDirection.x += -1
	if Input.is_action_pressed("player_move_right"):
		desiredDirection.x += 1
	if Input.is_action_pressed("player_move_up"):
		desiredDirection.y += -1
	if Input.is_action_pressed("player_move_down"):
		desiredDirection.y += 1
		
	MovementDir = desiredDirection
	TargetPoint =  get_global_mouse_position()
		
	if Input.is_action_pressed("player_weapon_switch_rifle"):
		_switch_weapon(WEAPON_TYPE.WEAPON_RIFLE)
		
	if Input.is_action_pressed("player_weapon_switch_shotgun"):
		_switch_weapon(WEAPON_TYPE.WEAPON_SHOTGUN)
		
	if Input.is_action_pressed("player_shoot") && cooldown.is_stopped():
		(activeWeapon as WeaponBase)._shoot()
		emit_signal("on_player_shoot")
	
	if Input.is_action_pressed("player_weapon_reload") && activeWeapon._can_reload(): 
		activeWeapon._reload()
		
	pass
	
	
func _switch_weapon(weapon_type):
	match weapon_type:
		WEAPON_TYPE.WEAPON_RIFLE:
			activeWeapon = $Rifle
		WEAPON_TYPE.WEAPON_SHOTGUN:
			activeWeapon = $Shotgun
	cooldown.wait_time = activeWeapon.DRAW_COOLDOWN
	cooldown.start()
	pass

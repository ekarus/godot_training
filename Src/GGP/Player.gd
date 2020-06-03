extends Actor

class_name PlayerActor

# replace this with weapons array

onready var activeWeapon = $Weapon

# Called when the node enters the scene tree for the first time.
func _ready():
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
	
	if Input.is_action_pressed("player_shoot"):
		(activeWeapon as WeaponBase)._shoot(self.position + activeWeapon.position, -self.rotation_degrees)

	pass
	
	
func _input(event):
	if event is InputEventMouseMotion:
		TargetPoint = event.position

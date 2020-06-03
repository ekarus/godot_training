extends KinematicBody2D
class_name Actor

export (float) var MOVE_SPEED = 200

var MovementDir = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var velocity = MovementDir * MOVE_SPEED
	
	move_and_slide(velocity)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends KinematicBody2D
class_name Actor

export (float) var MOVE_SPEED = 200

var MovementDir = Vector2()
var TargetPoint = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var velocity = MovementDir.rotated(rotation + deg2rad(90)) * MOVE_SPEED
	
	move_and_slide(velocity)
	pass

func _process(delta):
	look_at(TargetPoint)

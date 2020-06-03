extends Area2D
class_name Projectile

export var speed := 1650.0
export var damage := 10.0
export var lifetime := 1.5

var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	direction =  Vector2(sin(-rotation), cos(rotation))
	var timer = Timer.new()
	timer.connect("timeout", self, "queue_free")
	timer.wait_time = lifetime
	timer.autostart = true
	add_child(timer)

func _physics_process(delta: float) -> void:
	global_position += speed * -direction * delta
	pass

func _on_Projectile_body_entered(body):
	if body is Actor:
		(body as Actor)._apply_damage(damage)
		destroy()
	pass # Replace with function body.

func destroy():
#	self.set_is_active = false
	pass

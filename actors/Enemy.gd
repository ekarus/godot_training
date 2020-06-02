extends Node2D
class_name Enemy

onready var behavior = $Behaviour

var player

export(float) var speed = 100


func _ready():
	player = get_tree().get_root().find_node("Player", true, false)


func _process(delta):
	var process_result = behavior.process_logic(player)
	
	set_position(get_position() + (process_result.target_pos - get_position()).normalized() * speed * delta)

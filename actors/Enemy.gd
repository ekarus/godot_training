extends Actor
class_name Enemy

onready var behavior = $Behaviour

var player

export(float) var speed = 30


func _ready():
	player = get_tree().get_root().find_node("Player", true, false)


func _process(delta):
	var state = EnemyState.new()
	state.position = get_global_position()
	var process_result = behavior.process_logic(player, state)
	
	if process_result.should_move:
		MovementDir = process_result.move_target_pos - get_position()
	else:
		MovementDir = Vector2()
	
	if process_result.should_attack:
		pass

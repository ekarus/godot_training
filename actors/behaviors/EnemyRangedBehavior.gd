extends EnemyBehavior
class_name EnemyRangedBehavior

var attack_range = 100
var avoidance_distance = 50
var move_threshold = 5

func _init():
	pass


func process_logic(player, our_state):
	var player_pos = player.get_global_position() if player else Vector2(0,0)
	var dist_vec = our_state.position - player_pos
	var dist = dist_vec.length()
	
	var action = BehaviorAction.new()
	
	# step inside the attack range + threshold or step on some distance
	if dist - move_threshold > attack_range:
		# print("getting closer")
		action.move_target_pos = player_pos + dist_vec.normalized() * attack_range
		action.should_move = true
	# or step away if standing too close
	elif dist + move_threshold < avoidance_distance:
		# print("running away")
		action.move_target_pos = player_pos + dist_vec.normalized() * avoidance_distance
		action.should_move = true
	else:
		# print("we're in a good position")
		action.should_move = false
	
	# attack?
	if dist < attack_range:
		# print("attack")
		action.should_attack = true
		action.attack_target_pos = player_pos
	
	return action


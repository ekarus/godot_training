extends EnemyBehavior
class_name EnemyMeleeBehavior


func _init():
	pass


func process_logic(player):
	var player_pos =  player.get_global_position() if player else Vector2(0,0)

	var action = BehaviorAction.new()
	action.target_pos = player_pos
	return action


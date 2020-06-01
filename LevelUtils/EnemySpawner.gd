extends Node

var timer = Timer.new()
var rng = RandomNumberGenerator.new()

var game_time_passed = 0
var spawn_progression_over_time = {
	0: [5, 10],
	30: [2, 6]
}

export var spawn_radius = 100

export(NodePath) var player

export (PackedScene) onready var enemy_scene = preload("res://actors/Enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	
	timer.connect("timeout",self,"_on_timer_tick") 
	# we want to change tick time each tick
	timer.set_one_shot(true)
	add_child(timer)
	
	_spawn_new_enemy()
	_schedule_next_spawn()

func _schedule_next_spawn():
	var range_keys = spawn_progression_over_time.keys()
	
	var best_time = 0
	for time in range_keys:
		if time < game_time_passed and time >= best_time:
			best_time = time
	
	var range_values = spawn_progression_over_time[best_time]
	
	timer.set_wait_time(rng.randi_range(range_values[0], range_values[1]))
	timer.start()

func _on_timer_tick():
	_spawn_new_enemy()
	_schedule_next_spawn()
	pass

func _spawn_new_enemy():
	var player_pos = get_node(player).get_global_position()
	var spawn_angle = rng.randf_range(0, 2*PI)
	var position = player_pos + Vector2(spawn_radius, 0).rotated(spawn_angle)
	var nodeInstance = enemy_scene.instance()
	get_tree().get_root().add_child(nodeInstance)
	nodeInstance.set_global_position(position)
	print("spawned ", position.x, " ", position.y)
	print("player_pos ", player_pos.x, " ", player_pos.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_time_passed += delta

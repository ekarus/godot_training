extends Node

signal health_updated
signal score_updated
signal game_over

export var _max_health := 100
export var _default_health := 100

var score: = 0 setget set_score
var health: = _default_health setget set_health

func set_score(value: int):
	score = value
	emit_signal("score_updated")

func set_health(value: int):
	health = clamp(value, 0, _max_health)
	if health <= 0:
		emit_signal("game_over")
	else:
		emit_signal("health_updated")

func reset():
	score = 0
	health = _default_health

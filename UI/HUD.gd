extends Control

onready var bar: = get_node("HealthBar")
onready var score: = $Score/Label

func _ready():
	PlayerData.connect("health_updated", self, "on_health_updated")
	PlayerData.connect("score_updated", self, "on_score_updated")
	
func on_health_updated():
	bar.set_health(PlayerData.health)

func on_score_updated():
	score.text = str(PlayerData.score)

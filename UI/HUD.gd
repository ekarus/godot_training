extends Control

onready var ammo: = $Ammo
onready var bar: = $HealthBar
onready var score: = $Score/Label

func _ready():
	PlayerData.connect("ammo_updated", self, "_on_ammo_updated")
	PlayerData.connect("health_updated", self, "_on_health_updated")
	PlayerData.connect("score_updated", self, "_on_score_updated")

func _on_ammo_updated():
	ammo.set_ammo(PlayerData.roundsLeft, PlayerData.cageSize)
	
func _on_health_updated():
	bar.set_health(PlayerData.health)

func _on_score_updated():
	score.text = str(PlayerData.score)

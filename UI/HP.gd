extends HBoxContainer

onready var label: = $Control/Label
onready var progress: = $TextureProgress

func set_health(value: int):
	label.text = str(value)
	progress.value = value

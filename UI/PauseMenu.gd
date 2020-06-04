extends Control

onready var scene_tree: = get_tree()

var paused: = false setget set_paused

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	self.visible = value

func _on_RestartButton_pressed():
	PlayerData.reset()
	self.paused = false
	scene_tree.reload_current_scene()

func _on_ResumeButton_pressed():
	self.paused = false

extends Control

export var GameScene: PackedScene


func _on_StartButton_pressed():
	get_tree().change_scene_to(GameScene)

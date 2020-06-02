extends Control

export var GameScene: PackedScene


func _on_TextureButton_pressed():
	get_tree().change_scene_to(GameScene)

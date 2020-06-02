# Creates, maintains, and organizes spawned special effects or projectiles; 
# objects that should be untied from their spawners' lifespan when freed.
extends Node

onready var _projectiles := $Projectiles

func register_projectile(projectile: Node) -> void:
	_projectiles.add_child(projectile)

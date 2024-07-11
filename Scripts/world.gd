extends Node2D

@onready var spider: CharacterBody2D = $Spider

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Restart"):
		get_tree().reload_current_scene()


extends Node2D

@export var spider: CharacterBody2D 
@export var spawn_fly_timer: Timer
var fly_scene = preload("res://Scenes/fly.tscn")

func _process(delta: float) -> void:
	pass

#func _ready() -> void:
	#spawn_fly_timer.start()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Restart"):
		get_tree().reload_current_scene()
#
#func _on_spawn_fly_timer_timeout() -> void:
	#var new_fly = fly_scene.instantiate()
	#var random_rotation: int = randi_range(1, 359) 
	#new_fly.rotation_degrees = random_rotation
	#add_child(new_fly)
	#spawn_fly_timer.start()

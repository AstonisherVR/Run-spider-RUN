extends Area2D
signal eaten

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees += randi_range(-30, 30)
	#global_position = random_spawn_position()

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		print("FLY EATEN")
		eaten.emit()
		queue_free()

#func random_spawn_position():
	#var random_x_coord: int = randi_range(-2, 2)
	#var random_y_coord: int = randi_range(-2, 2)
	#var next_x_spawnpoint: int = random_x_coord * 64
	#var next_y_spawnpoint: int  = random_y_coord * 64
	#var next_spawnpoint: Vector2 = Vector2(next_x_spawnpoint, next_y_spawnpoint)
	#return next_spawnpoint

 

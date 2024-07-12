extends Area2D
signal eaten

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = random_spawn_position()

func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("FLY EATEN")
	eaten.emit()

func _on_eaten() -> void:
	pass

func random_spawn_position():
	var random_x_coord: int = randi_range(1,10)
	var random_y_coord: int = randi_range(1, 10)
	var next_x_spawnpoint: int = random_x_coord * 64
	var next_y_spawnpoint: int  = random_y_coord * 64
	var next_spawnpoint: Vector2 = Vector2(next_x_spawnpoint, next_y_spawnpoint)
	return next_spawnpoint

 

extends Area2D
signal eaten

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node2D) -> void:
	print("FLY EATEN")
	eaten.emit()

func _on_eaten() -> void:
	queue_free()

extends Control

@onready var play_again_button: Button = %"Play Again Button"
@onready var quit_button: Button = %"Quit Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

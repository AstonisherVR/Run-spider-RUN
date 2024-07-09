extends CharacterBody2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * speed

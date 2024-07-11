extends CharacterBody2D

@export var spider_sprite: Sprite2D
@export var hunger_timer: Timer
@export var poison_timer: Timer
@export var hunger_bar: ProgressBar 
@export var poison_bar: ProgressBar
#@export var hunger_label: Label
#@export var poison_label: Label
@export var speed: float = 400.0

var next_position: Vector2
var moving: bool = false
var position_coords: Vector2 = Vector2.ZERO
const STARTING_HUNGER_VALUE: int = 100
const STARTING_POISON_VALUE: int = 0

func _ready():
	hunger_bar.value = STARTING_HUNGER_VALUE
	poison_bar.value = STARTING_POISON_VALUE
	hunger_timer.start()

func _physics_process(delta: float) -> void:
	move(delta)

func _input(event: InputEvent) -> void:
	if not moving:
		if event.is_action_pressed("Left"):
			position_coords.x -= 128
			spider_sprite.rotation_degrees = -90
			start_moving()
		elif event.is_action_pressed("Right"):
			position_coords.x += 128
			spider_sprite.rotation_degrees = 90
			start_moving()
		elif event.is_action_pressed("Up"):
			position_coords.y -= 128
			spider_sprite.rotation_degrees = 0
			start_moving()
		elif event.is_action_pressed("Down"):
			position_coords.y += 128
			spider_sprite.rotation_degrees = 180
			start_moving()

func start_moving() -> void:
	moving = true
	next_position = global_position + position_coords
	position_coords = Vector2.ZERO

func move(delta: float) -> void:
	if moving:
		global_position = global_position.move_toward(next_position, delta * speed)
		if global_position.distance_to(next_position) < 1.0:
			moving = false

func _on_hunger_timer_timeout() -> void:
	hunger_timer.wait_time = randf_range(0.25, 1)
	hunger_bar.value -= 1
	hunger_timer.start()

func _on_poison_timer_timeout() -> void: 
	poison_bar.value += 1
	poison_timer.start()

func _on_fly_eaten() -> void:
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3

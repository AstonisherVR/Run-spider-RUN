extends CharacterBody2D

@export var spider_sprite: Sprite2D
@export var hunger_timer: Timer
@export var poison_timer: Timer
@export var hunger_bar: ProgressBar 
@export var poison_bar: ProgressBar
@export var slurp_audio: AudioStreamPlayer
@export var flies_eaten_label: Label
#@export var hunger_label: Label
#@export var poison_label: Label
@export var speed: float = 400.0

var slurp_sounds: Array = [preload("res://SFX/Slurp 1.wav"), preload("res://SFX/Slurp 2.wav"), preload("res://SFX/Slurp 3.wav"), preload("res://SFX/Slurp 4.wav")]
var next_position: Vector2
var moving: bool = false
var position_coords: Vector2 = Vector2.ZERO
const STARTING_HUNGER_VALUE: int = 100
const STARTING_POISON_VALUE: int = 0

func _ready():
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	hunger_bar.value = STARTING_HUNGER_VALUE
	poison_bar.value = STARTING_POISON_VALUE
	hunger_timer.start()

func _physics_process(delta: float) -> void:
	if hunger_bar.value <= 0:
		get_tree().change_scene_to_file("res://Scenes/UI Scenes/game_over.tscn")
	move(delta)

func _input(event: InputEvent) -> void:
	if not moving:
		if event.is_action_pressed("Left"):
			position_coords.x -= 64
			spider_sprite.rotation_degrees = -90
			start_moving()
		elif event.is_action_pressed("Right"):
			position_coords.x += 64
			spider_sprite.rotation_degrees = 90
			start_moving()
		elif event.is_action_pressed("Up"):
			position_coords.y -= 64
			spider_sprite.rotation_degrees = 0
			start_moving()
		elif event.is_action_pressed("Down"):
			position_coords.y += 64
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
	hunger_bar.value -= 5
	hunger_timer.start()

func _on_poison_timer_timeout() -> void: 
	poison_bar.value += 1
	poison_timer.start()

func _on_fly_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3

func _on_fly_12_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3

func _on_fly_2_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_3_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_4_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3



func _on_fly_5_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_6_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_7_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_8_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_9_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3


func _on_fly_10_eaten() -> void:
	Gloabals.flies_eaten += 1
	flies_eaten_label.text = flies_eaten_label.text + str(Gloabals.flies_eaten)
	slurp_audio.stream = slurp_sounds[randi_range(0, 3)]
	slurp_audio.volume_db = -10
	slurp_audio.play()
	if hunger_bar.value + 3 > 100:
		hunger_bar.value = 100
	else:
		hunger_bar.value += 3

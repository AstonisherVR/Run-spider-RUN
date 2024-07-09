extends Node2D

@export var center_marker: Marker2D
@export var web_texture: Texture2D
@export var line_width: float = 2
@export var line_length: float = 2
@export var size_of_web: int = 2

func _ready() -> void:
	generate_web(center_marker)

func connect_markers(marker1, marker2):
	var web_line = Sprite2D.new()
	web_line.texture = web_texture
	web_line.scale = Vector2(line_width, line_length)

func generate_web(marker):
	pass

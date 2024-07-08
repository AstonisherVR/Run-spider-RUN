extends Node2D

#const WEB = preload("res://Scenes/web.tscn")

var markers = []

func _ready():
	generate_web()

func generate_web():
	# Create the central pentagon
	var web = WEB.instantiate()
	add_child(web)
	var center_marker = web.get_node("Marker2D")
	markers.append(center_marker)

	for i in range(5):
		var angle = i * PI / 2.5
		var web_instance = WEB.instantiate()
		add_child(web_instance)
		var marker = web_instance.get_node("Marker2D")
		marker.position = center_marker.position + Vector2(cos(angle), sin(angle)) * 100
		markers.append(marker)

	# Recursively generate the rest of the web
	generate_hexagons(center_marker, 0)

func generate_hexagons(marker, depth):
	if depth > 5:
		return

	for i in range(6):
		var angle = i * PI / 3
		var web_instance = WEB.instantiate()
		add_child(web_instance)
		var new_marker = web_instance.get_node("Marker2D")
		new_marker.position = marker.position + Vector2(cos(angle), sin(angle)) * 100
		markers.append(new_marker)
		connect_markers(marker, new_marker)

		if randi() % 2 == 0:
			continue  # Skip connecting with a random chance
		generate_hexagons(new_marker, depth + 1)
		
func connect_markers(marker1, marker2):
	var web_line = Line2D.new()
	web_line.texture = load("res://2D Sprites/Line Particle.png")
	web_line.points = [marker1.position, marker2.position]
	add_child(web_line)

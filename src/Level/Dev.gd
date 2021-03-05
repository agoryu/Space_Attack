extends Node2D

onready var meteor := preload("res://src/Objects/Meteor.tscn")
onready var path := $MeteorSpawnPath/PathFollow2D
onready var timer := $MeteorSpawnTimer

func _process(delta):
	var score = Main.score
	if score > 10 and score <= 20:
		timer.wait_time = 2
	elif score > 20:
		timer.wait_time = 1

func _on_MeteorSpawnTimer_timeout():
	path.offset = randi()
	var new_meteor = meteor.instance()
	new_meteor.position = path.position
	add_child(new_meteor)

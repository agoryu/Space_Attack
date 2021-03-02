extends Node2D

signal score_updated(point)
signal game_over
signal shake_screen
signal paused

var score : int = 0 setget set_score
var paused : bool = false

func set_score(point):
	score += point
	emit_signal("score_updated", point)
	
func game_over():
	emit_signal("game_over")
	
func shake_screen():
	emit_signal("shake_screen")
	
func paused(value):
	paused = value
	emit_signal("paused")

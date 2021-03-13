extends Node2D

onready var uiplayer : UIPlayer = $UserInterface/UIPlayer
onready var tree := get_tree()
onready var paused_overlay := $ScreenLayer/Pause
onready var game_over_overlay := $ScreenLayer/GameOver
onready var anim_warning := $WarningLayer/AnimationPlayer

var paused : bool = false setget set_paused

func _ready():
	uiplayer.startGame()
	Main.connect("paused", self, "make_pause")
	Main.connect("game_over", self, "game_over")
	Main.connect("warning", self, "warning")
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		self.paused = !paused
		tree.set_input_as_handled()
	
func set_paused(value: bool):
	paused = value
	tree.paused = value
	paused_overlay.visible = value

func make_pause():
	self.paused = Main.paused
	
func game_over():
	get_tree().change_scene("res://src/Screens/GameOver.tscn")

func warning():
	if !anim_warning.is_playing():
		anim_warning.play("warning")

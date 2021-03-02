extends Control
class_name UIPlayer

onready var score_label : Label = $Score
onready var message : Label = $Messages
onready var animMessage : AnimationPlayer = $Messages/AnimationPlayer

func _ready():
	Main.connect("score_updated", self, "update_score")

func startGame():
	message.text = "Start"
	animMessage.play("display")

func update_score():
	score_label.text = "Score: %s" % Main.score

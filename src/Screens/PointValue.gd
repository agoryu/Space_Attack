extends StaticBody2D
class_name PointValue

onready var animation : AnimationPlayer = $AnimationPlayer
onready var label : Label = $Label

export var value : int
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "%s" % value
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

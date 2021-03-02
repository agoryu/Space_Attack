extends Area2D

onready var animationPlayer : AnimationPlayer = $AnimationPlayer
onready var sprite : Sprite = $Sprite
onready var pointLabel := preload("res://src/Screens/PointValue.tscn")

export var minSpeed : float = 50
export var maxSpeed : float = 80
var speed : float = 0.0

export var minRotation : float = -10
export var maxRotation : float = 10
var rotationAngle : float = 0.0

export var maxLife : int = 20
export var minScale : int = 50
export var maxScale : int = 200
export var life : int = 20
export var point : int = 1

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationAngle = rand_range(minRotation, maxRotation)
	var resultRand = rand_range(minScale, maxScale)
	life = maxLife * resultRand / maxScale
	var scaleResult = float(resultRand) / 100.0
	scale = Vector2(scaleResult, scaleResult)
	point = resultRand / 50
	sprite.frame = rand_range(0, 3)

func _physics_process(delta):
	self.position.y += speed * delta
	self.rotation_degrees += rotationAngle * delta

func damage(damage):
	life -= damage
	if life <= 0:
		Main.set_score(point)
		Main.shake_screen()
		animationPlayer.play("explose")
		
func display_point():
	var pointValue = pointLabel.instance() as PointValue
	add_child(pointValue)
	pointValue.set_as_toplevel(true)
	pointValue.label.text = "+%s" % point
	pointValue.global_position = global_position

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

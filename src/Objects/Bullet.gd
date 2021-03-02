extends Area2D
class_name Bullet

onready var audio_player : AudioStreamPlayer = $AudioPlayer

var speed: float = 500.0

func _ready():
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	self.position.y += speed * delta * -1


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D_area_entered(area):
	area.damage(1)
	queue_free()

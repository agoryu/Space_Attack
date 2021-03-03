extends Node2D

onready var view : = get_viewport_rect()
onready var bullet := preload("res://src/Objects/Bullet.tscn")
onready var leftGun := $FiringsPosition/LeftGun
onready var rightGun := $FiringsPosition/RightGun 
onready var fireTimer := $FireTimer
onready var energyTimer := $EnergyTimer
onready var sprite := $Sprite

# Ship variables
var speed : float = 300.0
var energy : float = 255
var sub_energy : float = 5
var max_energy : float = 255

# Shoot variables
const TIME_SHOOT : float = 0.1
var shoot_right : bool = true

func _ready():
	Main.connect("score_updated", self, "calcul_energy")

# Process
func _process(delta):
	if Input.is_action_pressed("ui_select") and fireTimer.is_stopped():
		fireTimer.start(TIME_SHOOT)
		shoot()
	if energyTimer.is_stopped() and energy > 0:
		energy -= sub_energy
		sprite.material.set_shader_param("energy", energy/max_energy)
		energyTimer.start()
	if energy <= 0:
		Main.game_over()

# Physic Process
func _physics_process(delta):
	var direction = Vector2.ZERO
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
	velocity = direction.normalized() * speed
	position.x = clamp(position.x + velocity.x  * delta, 0, view.size.x)
	position.y = clamp(position.y + velocity.y * delta, 0, view.size.y)

# Create bullet
func shoot():
	var bullet_shoot = bullet.instance() as Bullet
	add_child(bullet_shoot)
	bullet_shoot.set_as_toplevel(true)
	if shoot_right:
		bullet_shoot.global_position = rightGun.global_position
	else:
		bullet_shoot.global_position = leftGun.global_position
	shoot_right = !shoot_right
	energy -= 1


func _on_Area2D_area_entered(area):
	Main.game_over()
	
func calcul_energy(point):
	energy += point * 10

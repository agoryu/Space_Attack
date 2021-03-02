extends Control

onready var buttons : Array = [$VBoxContainer/Retry, $VBoxContainer/Quit]
onready var timer : Timer = $Timer
var button_selected : int = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	buttons[button_selected].grab_focus()
	if Input.is_action_pressed("ui_accept"):
		buttons[button_selected].pressed = true
	
	if (Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right")) and timer.is_stopped():
		timer.start()
		button_selected = (button_selected + 1) % 2 
		
	if (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left")) and timer.is_stopped():
		timer.start()
		button_selected = (button_selected + 1) % 2 

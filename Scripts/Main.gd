extends Node2D

onready var dialogue = get_node('../Main/Dialogue')


var can_click = true

func _on_BarryArea_mouse_entered():
	$Background/BarryArea/BarrySprite.set_modulate(Color('4d39df'))

func _on_BarryArea_mouse_exited():
	$Background/BarryArea/BarrySprite.set_modulate(Color(1, 1, 1))
	can_click = true


func _on_JohnArea_mouse_entered():
	$Background/JohnArea/JohnSprite.set_modulate(Color('4d39df'))


func _on_JohnArea_mouse_exited():
	$Background/JohnArea/JohnSprite.set_modulate(Color(1, 1, 1))
	can_click = true

func _on_JohnArea_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click == true:
		print("john clicked")
		can_click = false


func _on_BarryArea_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click == true:
		print("barry clicked")
		can_click = false

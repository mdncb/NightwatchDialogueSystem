extends Control

var can_click = true
var john_close = false
var barry_close = false

func _ready():
	pass


func _input(event):
	if Input.is_action_just_pressed("ui_right"):
		$BackgroundArea/BarryConsole/AnimationPlayer.play('BarryConsoleSlowOut')
	if Input.is_action_just_pressed("ui_left"):
		$BackgroundArea/BarryConsole/AnimationPlayer.play('BarryConsoleFastIn')
	if john_close:
#		$BackgroundArea/JohnPopup.popup()
		pass
	if barry_close:
#		$BackgroundArea/BarryPopup.popup()
		pass

	
func _on_BarryConsole_mouse_entered():
	if not barry_close:
		$BackgroundArea/BarryConsole/BarryConsoleSprite.set_modulate(Color('4d39df'))
	else:
		can_click = false

func _on_BarryConsole_mouse_exited():
	$BackgroundArea/BarryConsole/BarryConsoleSprite.set_modulate(Color(1, 1, 1))
	can_click = true


func _on_JohnConsole_mouse_entered():
	if not john_close:
		$BackgroundArea/JohnConsole/JohnConsoleSprite.set_modulate(Color('4d39df'))
	else:
		can_click = false

func _on_JohnConsole_mouse_exited():
	$BackgroundArea/JohnConsole/JohnConsoleSprite.set_modulate(Color(1, 1, 1))
	can_click = true


func _on_JohnConsole_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click == true:
		if barry_close:
			$BackgroundArea/BarryClose/AnimationPlayer.play('BarryCloseSlideOut')
			barry_close = false
		$BackgroundArea/JohnClose/AnimationPlayer.play('JohnCloseSlideIn')
		john_close = true
		show_john_dialogue()
		can_click = false


func _on_BarryConsole_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click == true:
#		if john_close:
#			$BackgroundArea/JohnClose/AnimationPlayer.play('JohnCloseSlideOut')
#			john_close = false
#		$BackgroundArea/BarryClose/AnimationPlayer.play('BarryCloseSlideIn')
#		barry_close = true
#		$BackgroundArea/BarryPopup.popup()
#		can_click = false
		pass


func show_john_dialogue():
	$CanvasLayer/JohnPopup.popup()
	$CanvasLayer/JohnPopup.set_text(john_dialogues("0"))


func dialogue(dialogue_lines):
	$CanvasLayer/JohnPopup.popup()


func john_dialogues(id):
	match id:
		"0":
			return [["Yes SIR what is it now SIR?" , "John, you have to fix this.", "John, what should we do?", "John, I need your help", "I'm scared, John"], ["0", "1a", "2a", "3a", "4a"]]
		"1a":
			return [["Me? You want me to fix this?", "Yes.", "No.", "I think you're the only one who can."], ["0", "1a1", "1a2", "1a3"]]


func _on_JohnPopup_button_id(button_id):
	print(button_id)
	var next_dialogue = john_dialogues(button_id)
	$CanvasLayer/JohnPopup.set_text(next_dialogue)
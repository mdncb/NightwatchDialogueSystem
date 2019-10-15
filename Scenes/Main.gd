extends Control

var can_click = true
var john_close = false
var barry_close = false

func _process(delta):
	pass
#	if john_close or barry_close:
#		$BackgroundArea/BackgroundSprite.set_modulate(Color('464646'))
#		$BackgroundArea/BarryConsole/BarryConsoleSprite.set_modulate(Color('464646'))
#		$BackgroundArea/JohnConsole/JohnConsoleSprite.set_modulate(Color('464646'))
#		if john_close:
#			$CanvasLayer/JohnPopup.popup()


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
		"1a1":
			return [["What do you imagine I can do to fix this?", "You could use you enormous brain.", "You could find someone who can help.", "You could try talking to the computer."], ["0", "1a1a", "1a1b", "1a1c"]]
		"1a1a":
			return [["What's in it for me?", "A big thank-you and a firm handshake.", "The League's appreciation for all your hard work over the years.", "That attitude isn't helping the team now, is it?"], ["0", "1a1a1", "1a1a2", "1a1a3"]]
		"1a1a1":
			return [["Right. Well that will certainly make up for everything.", "[ -- end -- ]"], ["0", "end"]]
		"1a1a2":
			return [["Oh, spare me.", "Come on John, we all appreciate you here."], ["0", "1a1a2a"]]
		"1a1a2a":
			return [["What's my surname?", "Smith.", "McCruthers.", "John", "Brzeczyszczykiewicz."], ["0", "1a1a2a1", "1a1a2a2", "1a1a2a3", "1a1a2a4"]]
		"1a1a2a1":
			return [["You're not even trying.", "[ -- end -- ]"],["0", "end"]]
		"1a1a2a2":
			return [["No.", "[ -- end -- ]"],["0", "end"]]
		"1a1a2a3":
			return [["No, that's my first name.", "[ -- end -- ]"],["0", "end"]]
		"1a1a2a4":
			return [["Just stop.", "[ -- end -- ]"],["0", "end"]]
		"1a1a3":
			return [["The 'Team' hasn't remembered my birthday for the past eight years.", "[ -- end -- ]"], ["0", "end"]]
		"1a1b":
			return [["Oh, of course. There's no chance I could possibly do anything. Sort it out yourselves, then.", "[ -- end --]"], ["0", "end"]]
		"1a1c":
			return [["Do you know how to say 'Computer: change the language back to English'?", "No."], ["0", "1a1c1"]]
		"1a1c1":
			return [["Do you know how to say 'English' in Russian?", "No."], ["0", "1a1c1a"]]
		"1a1c1a":
			return [["Do you know any Russian at all?", "No."], ["0", "1a1c1a1"]]
		"1a1c1a1":
			return [["Well, neither do I.", "[ -- end --]"],["0", "end"]]
		"1a2":
			return [["Then what are you bothering me for? Go and tell Barry to fix it", "[ -- end -- ]"], ["0", "end"]]
		"1a3":
			return [["You're probably right.", "You're our only hope!", "We can't do it without you!", "The fate of the League rests on your shoulders!"], ["0", "answerno", "answerno", "answerno"]]
		"answerno":
			return [["Wow, it's so nice to be needed only when you can't ask the stupid computer for help first. The answer is no.", "[ -- end -- ]"], ["0", "end"]]







func _on_JohnPopup_button_id(button_id):
	print(button_id)
	if button_id == "end":
		john_close = false
		$CanvasLayer/JohnPopup.hide()
		$BackgroundArea/JohnClose/AnimationPlayer.play('JohnCloseSlideOut')
	else:
		var next_dialogue = john_dialogues(button_id)
		$CanvasLayer/JohnPopup.set_text(next_dialogue)
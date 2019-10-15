extends Popup

signal button_id

var button_id

func set_text(dialogue_lines):
	$NinePatchRect2/VBoxContainer/Button.visible = false
	$NinePatchRect2/VBoxContainer/Button2.visible = false
	$NinePatchRect2/VBoxContainer/Button3.visible = false
	$NinePatchRect2/VBoxContainer/Button4.visible = false

	var dialogue_size = dialogue_lines[0].size()
	set_button_visibility(dialogue_size)
	set_button_labels(dialogue_size, dialogue_lines)
	$NinePatchRect2/RichTextLabel.bbcode_text = String(dialogue_lines[0][0])


func set_button_visibility(n):
	if n == 1:
		return
	if n > 1:
		$NinePatchRect2/VBoxContainer/Button.visible = true
		if n > 2:
			$NinePatchRect2/VBoxContainer/Button2.visible = true
			if n > 3:
				$NinePatchRect2/VBoxContainer/Button3.visible = true
				if n > 4:
					$NinePatchRect2/VBoxContainer/Button4.visible = true


func set_button_labels(dialogue_size, dialogue_lines):
	if dialogue_size == 1:
		return
	if dialogue_size > 1:
		$NinePatchRect2/VBoxContainer/Button.set_text(dialogue_lines[0][1])
		$NinePatchRect2/VBoxContainer/Button.button_id = dialogue_lines[1][1]
		#print($NinePatchRect2/VBoxContainer/Button.button_id)
		if dialogue_size > 2:
			$NinePatchRect2/VBoxContainer/Button2.set_text(dialogue_lines[0][2])
			$NinePatchRect2/VBoxContainer/Button2.button_id = dialogue_lines[1][2]
			if dialogue_size > 3:
				$NinePatchRect2/VBoxContainer/Button3.set_text(dialogue_lines[0][3])
				$NinePatchRect2/VBoxContainer/Button3.button_id = dialogue_lines[1][3]
				if dialogue_size > 4:
					$NinePatchRect2/VBoxContainer/Button4.set_text(dialogue_lines[0][4])
					$NinePatchRect2/VBoxContainer/Button4.button_id = dialogue_lines[1][4]


func _on_Button_pressed():
	button_id = $NinePatchRect2/VBoxContainer/Button.button_id
	print(button_id)
	emit_signal("button_id", button_id)


func _on_Button2_pressed():
	button_id = $NinePatchRect2/VBoxContainer/Button2.button_id
	emit_signal("button_id", $NinePatchRect2/VBoxContainer/Button2.button_id)


func _on_Button3_pressed():
	emit_signal("button_id", $NinePatchRect2/VBoxContainer/Button3.button_id)


func _on_Button4_pressed():
	emit_signal("button_id", $NinePatchRect2/VBoxContainer/Button4.button_id)

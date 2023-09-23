extends CanvasLayer

# notifies 'main' node the button has been pressed
signal start_game

func show_message(text: String):
	$Message.text = text
	$Message.show()

func show_message_and_start_timer(text: String):
	show_message(text)
	$MessageTimer.start()

func show_game_over():
	show_message_and_start_timer("Game Over")
	# wait until the Messagetimer has counted down.
	await $MessageTimer.timeout
	
	show_message("Dodge the\nCreeps!")
	
	# make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_message_timer_timeout():
	$Message.hide()

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

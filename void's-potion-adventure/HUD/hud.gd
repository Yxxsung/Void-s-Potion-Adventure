extends CanvasLayer

#This is the HUD Code
#last edited on 03/07/2025

signal start_game
@onready var score_label = $MarginContainer/HBoxContainer/Label
@onready var message = $VBoxContainer/Message
@onready var start_button = $VBoxContainer/StartButton
@onready var Item_counter = $MarginContainer/HBoxContainer/Label


func show_message(text):
	message.text = text
	message.show()
	$Timer.start()

func update_score(value):
	score_label.text = str(value)

func update_items(value):
	for item in 5:
		Item_counter[item].visible = value > item

func game_over():
	show_message("Game Over")
	await $Timer.timeout
	start_button.show()

func _on_start_button_pressed() -> void:
	start_button.hide()
	start_game.emit()

func _on_timer_timeout() -> void:
	message.hide()
	message.text = ""

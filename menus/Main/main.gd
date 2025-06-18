extends Control

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed() -> void:
	get_node("Main Menu").hide()
	get_node("Level Select").show()

extends Node2D

signal exit

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle := body as Circle
	Globals.exit.emit(circle)

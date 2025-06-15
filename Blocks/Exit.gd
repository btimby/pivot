extends Node2D

signal on_exit

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle := body as Circle
	self.on_exit.emit(circle)

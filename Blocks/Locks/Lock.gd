class_name Lock
extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle = body as Circle
	if not circle.has_key("yellow"):
		return
	self.queue_free()

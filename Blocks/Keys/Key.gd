class_name Key
extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle := body as Circle
	circle.give_key("yellow")
	self.queue_free()

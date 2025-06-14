class_name Circle
extends RigidBody2D

var keys: Array[String] = []

func give_key(color: String) -> void:
	self.keys.append(color)

func has_key(color: String) -> bool:
	return color in self.keys

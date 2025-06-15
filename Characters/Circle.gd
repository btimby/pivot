class_name Circle
extends RigidBody2D

var keys: Array[Globals.KeyColor] = []

func give_key(color: Globals.KeyColor) -> void:
	self.keys.append(color)

func has_key(color: Globals.KeyColor) -> bool:
	return color in self.keys

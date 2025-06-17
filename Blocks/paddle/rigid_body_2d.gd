extends RigidBody2D

func _ready() -> void:
	Globals.on_gravity_change.connect(on_gravity_change)

func on_gravity_change(gravity):
	self.apply_impulse(gravity)

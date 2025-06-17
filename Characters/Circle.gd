class_name Circle
extends RigidBody2D

@onready var bounce : AudioStreamPlayer2D = $Bounce
@onready var rolling : AudioStreamPlayer2D = $Rolling

var keys: Array[Globals.KeyColor] = []

# func _process(delta: float) -> void:
# 	if not self.linear_velocity.is_zero_approx() and not self.rolling.playing:
#		self.rolling.play()

func give_key(color: Globals.KeyColor) -> void:
	self.keys.append(color)

func has_key(color: Globals.KeyColor) -> bool:
	return color in self.keys

func _on_body_entered(body: Node) -> void:
	if self.rolling.playing:
		return
	self.rolling.play()

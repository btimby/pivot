extends Node2D

@export var CAMERA_CHASE_SPEED: float = 0.08
@export var ROTATE_SPEED: float = 3.0
@export var ROTATE_SPEED_MAX: float = 18
@export var ROTATE_ACCEL: float = 0.03

@onready var gravity: Vector2 = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
@onready var level: Node2D = $Center/Level
@onready var circle: RigidBody2D = $Circle
@onready var camera: Camera2D = $Camera
@onready var rotate_speed: float = self.ROTATE_SPEED

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		self._rotate(delta)
	elif Input.is_action_pressed("ui_right"):
		self._rotate(-delta)
	else:
		self.rotate_speed = self.ROTATE_SPEED
	self.camera.global_position = lerp(
		self.camera.position,
		self.circle.position,
		self.CAMERA_CHASE_SPEED,
	)

func _rotate(direction: float) -> void:
	self.rotate_speed = clamp(
		self.rotate_speed + self.ROTATE_ACCEL,
		self.ROTATE_SPEED,
		self.ROTATE_SPEED_MAX,
	)
	self.gravity = self.gravity.rotated(self.rotate_speed * direction).normalized()
	self.circle.apply_impulse(self.gravity)
	self.camera.rotation = self.gravity.angle() + Vector2.UP.angle()
	PhysicsServer2D.area_set_param(
		get_viewport().find_world_2d().space,
		PhysicsServer2D.AREA_PARAM_GRAVITY_VECTOR,
		self.gravity,
	)

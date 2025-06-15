@tool
class_name Lock
extends Node2D

const SPRITES : Dictionary[Globals.KeyColor, Texture2D] = {
	Globals.KeyColor.RED: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/lock_red.png"),
	Globals.KeyColor.YELLOW: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/lock_yellow.png"),
	Globals.KeyColor.BLUE: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/lock_blue.png"),
	Globals.KeyColor.GREEN: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/lock_green.png"),
}

@onready var sprite : Sprite2D = $Sprite2D

@export var color : Globals.KeyColor = Globals.KeyColor.YELLOW:
	set(value):
		color = value
		if not Engine.is_editor_hint():
			return
		self.sprite.texture = SPRITES[value]

func _ready() -> void:
	self.sprite.texture = SPRITES[self.color]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle = body as Circle
	if not circle.has_key(self.color):
		return
	self.queue_free()

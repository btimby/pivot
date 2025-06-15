@tool
class_name Key
extends Node2D

const SPRITES: Dictionary[Globals.KeyColor, Texture2D] = {
	Globals.KeyColor.RED: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/key_red.png"),
	Globals.KeyColor.YELLOW: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/key_yellow.png"),
	Globals.KeyColor.BLUE: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/key_blue.png"),
	Globals.KeyColor.GREEN: preload("res://Assets/kenney_new-platformer-pack-1.0/Sprites/Tiles/Default/key_green.png"),
}

@export var color : Globals.KeyColor = Globals.KeyColor.YELLOW:
	# NOTE: Since this is a tool script, this setter ensures the key color
	# changes in the editor.
	set(value):
		color = value
		if not Engine.is_editor_hint():
			return
		self.sprite.texture = SPRITES[value]

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	self.sprite.texture = SPRITES[self.color]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not Circle:
		return
	var circle := body as Circle
	circle.give_key(self.color)
	self.queue_free()

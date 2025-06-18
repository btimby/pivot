extends Button

var game_scene : PackedScene
var target_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(on_pressed)

func on_pressed():
	var game_scene_instantiated = game_scene.instantiate()
	game_scene_instantiated.level = target_scene.instantiate()
	get_tree().get_root().get_node("Main").hide()
	get_tree().get_root().add_child(game_scene_instantiated)

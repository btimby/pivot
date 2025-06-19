extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scene_loads = []
	var dir = DirAccess.open("res://Levels/")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				if file_name.get_extension() == "tscn":
					var full_path = "res://Levels/".path_join(file_name)
					scene_loads.append([file_name.replace(".tscn",""),load(full_path)])
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	print(scene_loads)
	var script = preload("res://menus/Main/level_select_button.gd")
	var game_scene = preload("res://Game.tscn")
	for scene in scene_loads:
		var new_node = Button.new()
		new_node.set_name(scene[0])
		new_node.text = scene[0]
		new_node.set_script(script)
		new_node.game_scene = game_scene
		new_node.target_scene = scene[1]
		new_node.font_size = 30
		
		get_node("MarginContainer/VBoxContainer").add_child(new_node)

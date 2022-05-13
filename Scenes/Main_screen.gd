extends Base

#Paths for buttons
export var Document : PackedScene
export var News : PackedScene
export var Mission : PackedScene


func _ready():
	#Add self into the list for going back screens
	var layer = self.get_script().get_path()
	layer = str(layer).replace("gd", "tscn")
	Global.prev_scene.append(layer)
	
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _on_Mission_pressed():
	var _unused_value = get_tree().change_scene_to(Mission)


func _on_News_pressed():
	var _unused_value = get_tree().change_scene_to(News)


func _on_Documents_pressed():
	var _unused_value = get_tree().change_scene_to(Document)


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$Buttons/Mission_label, $Buttons/News_label, $Buttons/Documents_label, $Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$Buttons/Mission_label, $Buttons/News_label, $Buttons/Documents_label, $Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)

extends Base

export var Julie : PackedScene
export var Anna : PackedScene
export var Jen : PackedScene
export var Joseph : PackedScene
export var Castellan : PackedScene


func _ready():
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _on_Julie_pressed():
	var _unused_value = get_tree().change_scene_to(Julie)
	save_prev_scene()


func _on_Anna_pressed():
	var _unused_value = get_tree().change_scene_to(Anna)
	save_prev_scene()


func _on_Jen_pressed():
	var _unused_value = get_tree().change_scene_to(Jen)
	save_prev_scene()


func _on_Joseph_pressed():
	var _unused_value = get_tree().change_scene_to(Joseph)
	save_prev_scene()


func _on_Castellan_pressed():
	var _unused_value = get_tree().change_scene_to(Castellan)
	save_prev_scene()


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$Buttons/Settings_label, $Buttons/Julie_label, $Buttons/Anna_label, $Buttons/Jen_label, $Buttons/Joseph_label, $Buttons/Castellan_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$Buttons/Settings_label, $Buttons/Julie_label, $Buttons/Anna_label, $Buttons/Jen_label, $Buttons/Joseph_label, $Buttons/Castellan_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)

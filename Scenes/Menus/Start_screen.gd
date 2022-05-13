extends Control

export var Main_screen : PackedScene


func _ready():
	$Control.mouse_filter = 2
	get_tree().paused = true
	get_tree().call_group("update_font","update_font_heveltica")


func _on_TextureButton_pressed():
	get_tree().paused = false
	get_tree().change_scene_to(Main_screen)


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$TextureButton/Label , $TextureButton3/Label, $Control/Label2, $Settings/Label, $Settings/Label2, $Settings/Label5, $Settings/Label6]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$TextureButton/Label , $TextureButton3/Label, $Control/Label2, $Settings/Label, $Settings/Label2, $Settings/Label5, $Settings/Label6]:
		i.add_font_override("font", dynamic_font)


func _on_Font_Button_pressed():
	if Global.font == "Heveltica":
		$Settings/Label.text = "PONY ISLAND"
		Global.font = "Pony"
		update_font_pony()
		
	else:
		$Settings/Label.text = "HEVELTICA"
		Global.font = "Heveltica"
		update_font_heveltica()


func _on_Font_Button3_pressed():
	if Global.ambient_sound == false:
		Global.ambient_sound = true
		$Settings/Label5.text = "ON"
	else:
		Global.ambient_sound = false
		$Settings/Label5.text = "OFF"

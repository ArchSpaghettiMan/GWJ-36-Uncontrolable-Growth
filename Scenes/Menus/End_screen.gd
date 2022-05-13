extends Control


func _ready():
	for i in Endings.ending:
		$ScrollContainer/VBoxContainer/Label.text = $ScrollContainer/VBoxContainer/Label.text + i + "\r\n\r\n"
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _on_TextureButton_pressed():
	Endings.reset_game()


func _on_TextureButton3_pressed():
	get_tree().quit()


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$ScrollContainer/VBoxContainer/Label, $TextureButton/Label, $TextureButton3/Label]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$ScrollContainer/VBoxContainer/Label, $TextureButton/Label, $TextureButton3/Label]:
		i.add_font_override("font", dynamic_font)

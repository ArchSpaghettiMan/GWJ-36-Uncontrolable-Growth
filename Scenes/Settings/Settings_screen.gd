extends Base


func _ready():
	if Global.ambient_sound:
		$Label5.text = "ON"
	else:
		$Label5.text = "OFF"
	
	if Global.font == "Pony":
		$Label.text = "PONY ISLAND"
	else:
		$Label.text = "HEVELTICA"
	
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$Label7, $Label, $Label2, $Label5, $Label6, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$Label7, $Label, $Label2, $Label5, $Label6, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label]:
		i.add_font_override("font", dynamic_font)


func _on_Font_Button_pressed():
	Sound.accept()
	if Global.font == "Heveltica":
		$Label.text = "PONY ISLAND"
		Global.font = "Pony"
		update_font_pony()
	else:
		$Label.text = "HEVELTICA"
		Global.font = "Heveltica"
		update_font_heveltica()


func _on_Font_Button3_pressed():
	Sound.accept()
	if Global.ambient_sound == false:
		Global.ambient_sound = true
		$Label5.text = "ON"
	else:
		Global.ambient_sound = false
		$Label5.text = "OFF"

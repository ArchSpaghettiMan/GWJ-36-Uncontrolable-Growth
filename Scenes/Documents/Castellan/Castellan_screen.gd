extends Base


func _ready():
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _process(_delta):
	if Global.Castellan == true:
		$ScrollContainer/VBoxContainer/Label2.text = "  The room is like a deserted battlefield. There were old marks of blood and bandages littered on the floor. Some other things that was spotted were some weird metal screws and long springs."
	else:
		$ScrollContainer/VBoxContainer/Label2.text = "(Further information must be requested)"


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label, $ScrollContainer/VBoxContainer/Label, $ScrollContainer/VBoxContainer/Label2]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label, $ScrollContainer/VBoxContainer/Label, $ScrollContainer/VBoxContainer/Label2]:
		i.add_font_override("font", dynamic_font)

extends Base


func _ready():
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _process(_delta):
	if Global.Julie == true:
		$ScrollContainer/VBoxContainer/Label2.text = "  Her room is a filled with a variety of objects, newspapers, posters, envelops, clothes. The floor was printed with the black and red paint footprints from her factory shoes, while the bed was unmade and had bags on it with something like long screws and metal springs poking out. It seems as if the only organized part was the desk in the corner where newspaper with the latest events was posted on the wall and an old radio on the table. There is a picture of her kid and her grandmother on the table."
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

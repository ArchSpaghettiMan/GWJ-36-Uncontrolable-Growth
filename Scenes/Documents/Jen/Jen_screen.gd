extends Base


func _ready():
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _process(_delta):
	if Global.Jen == true:
		$ScrollContainer/VBoxContainer/Label2.text = "  The room contained of two worlds, split apart by the bed of Jen. On the left were clusters of tattered papers pieced together, standing on top of each other. Meanwhile, the right side was the polar opposite, it was splashed with patches of red and orange, blue and purple, black and white. The bed lies as a ghost in the middle amidst the war."
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

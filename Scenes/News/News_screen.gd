extends Base

var pre_fix = "8/" + str(Global.day) + "/1945, " 
var pre_morning = "morning:\r\n"
var pre_evening = "evening:\r\n"
var pre_night = "night:\r\n"

var event_1 = "Enemy of the people disguising as old hag was captured"
var event_2 = "Enemy of the people attacked police at midnight, report them immediately to the authorities if you spot them"
var event_3 = "Dark Red Black Graffiti containing heretic and false information spotted under the communal house"
var event_4 = "Enemies found in the 7th district, killed 7 police man during gun fight"
var event_5 = "Reports of police being attacked is skyrocketing despite attempts of prevention"
var event_6 = "Gathering forming at 568 Collective Avenue"
var event_7 = "Gathering at 568 Collective Avenue showing signs of turning violent"


func _ready():
	if int(Global.day_state) <= 140:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
	elif int(Global.day_state) <= 142:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
	elif int(Global.day_state) <= 150:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
	elif int(Global.day_state) <= 152:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
	elif int(Global.day_state) <= 161:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
	elif int(Global.day_state) <= 162:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
		$"ScrollContainer/VBoxContainer/3n".text = pre_fix + pre_night + event_6
	elif int(Global.day_state) <= 170:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
		$"ScrollContainer/VBoxContainer/3n".text = pre_fix + pre_night + event_6
		$"ScrollContainer/VBoxContainer/4m".text = pre_fix + pre_morning + event_7

	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func time_update():
	if int(Global.day_state) <= 140:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
	elif int(Global.day_state) <= 142:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
	elif int(Global.day_state) <= 150:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
	elif int(Global.day_state) <= 152:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
	elif int(Global.day_state) <= 161:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
	elif int(Global.day_state) <= 162:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
		$"ScrollContainer/VBoxContainer/3n".text = pre_fix + pre_night + event_6
	elif int(Global.day_state) <= 170:
		$"ScrollContainer/VBoxContainer/1m".text = pre_fix + pre_morning + event_1
		$"ScrollContainer/VBoxContainer/1n".text = pre_fix + pre_night + event_2
		$"ScrollContainer/VBoxContainer/2m".text = pre_fix + pre_morning + event_3
		$"ScrollContainer/VBoxContainer/2n".text = pre_fix + pre_night + event_4
		$"ScrollContainer/VBoxContainer/3e".text = pre_fix + pre_evening + event_5
		$"ScrollContainer/VBoxContainer/3n".text = pre_fix + pre_night + event_6
		$"ScrollContainer/VBoxContainer/4m".text = pre_fix + pre_morning + event_7


func update_font_heveltica():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/Helvetica.ttf")
	for i in [$"ScrollContainer/VBoxContainer/4m", $"ScrollContainer/VBoxContainer/3n", $"ScrollContainer/VBoxContainer/3e", $"ScrollContainer/VBoxContainer/2m", $"ScrollContainer/VBoxContainer/2n", $Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label, $"ScrollContainer/VBoxContainer/1m", $"ScrollContainer/VBoxContainer/1n"]:
		i.add_font_override("font", dynamic_font)


func update_font_pony():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://Assets/Fonts/VCR_OSD_MONO_1.001.ttf")
	for i in [$"ScrollContainer/VBoxContainer/4m", $"ScrollContainer/VBoxContainer/3n", $"ScrollContainer/VBoxContainer/3e", $"ScrollContainer/VBoxContainer/2m", $"ScrollContainer/VBoxContainer/2n", $Buttons/Settings_label, $Time/Current_time, $Time/Period_time, $Main_functions/Report_label, $Request_progress/Request_progress_2, $Request_progress, $Main_functions/Request_label, $"ScrollContainer/VBoxContainer/1m", $"ScrollContainer/VBoxContainer/1n"]:
		i.add_font_override("font", dynamic_font)

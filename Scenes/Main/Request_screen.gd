extends Control

#Global.minus_layer()
var morning = preload("res://Assets/Sprites/Morning-export.png")
var evening = preload("res://Assets/Sprites/Evening-export.png")
var night = preload("res://Assets/Sprites/Night-export.png")

var next_period 

var used_target

var used_color = Color("666666")


func _ready():
	$Selection_box.visible = false
	check_time()

	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _on_Cancel_pressed() -> void:
	Sound.accept()
	var _unused_value = get_tree().change_scene(Global.prev_scene[-1])
	Global.prev_scene.pop_back()


func _process(_delta):
	
	#Check target selection state of target to change text of request button
	if Global.target in Global.available_targets and Global.can_choose:
		$Main_functions/Request_label.text = "REQUEST INFORMATION\r\n(Click again to verify)"
	elif !Global.can_choose:
		$Main_functions/Request_label.text = "REQUEST INFORMATION\r\n(Requesting information)"
		$Request_progress/Request_progress_2.text = str(int((Global.get_node("Request_timer").get_wait_time() - Global.get_node("Request_timer").get_time_left())/Global.get_node("Request_timer").get_wait_time() * 100)) +"%"
	elif Global.target != null and !Global.target in Global.available_targets and Global.can_choose:
		$Main_functions/Request_label.text = "REQUEST INFORMATION\r\n(No target have been chosen)"
		$Request_progress/Request_progress_2.text = "Request Completed"
	
	#Check which buttons have been pressed
	if not "Julie" in Global.available_targets:
		$Buttons/Julie.modulate = used_color
		$Buttons/Julie_label.modulate = used_color
	if not "Anna" in Global.available_targets:
		$Buttons/Anna.modulate = used_color
		$Buttons/Anna_label.modulate = used_color
	if not "Jen" in Global.available_targets:
		$Buttons/Jen.modulate = used_color
		$Buttons/Jen_label.modulate = used_color
	if not "Joseph" in Global.available_targets:
		$Buttons/Joseph.modulate = used_color
		$Buttons/Joseph_label.modulate = used_color
	if not "Castellan" in Global.available_targets:
		$Buttons/Castellan.modulate = used_color
		$Buttons/Castellan_label.modulate = used_color
	
	#Check time of day
	check_time()
	$Time/Period_time.text = str(int(Global.get_node("Period_timer").get_time_left())) + " until " + next_period


func check_time():
	match Global.time:
		Global.Period.morning:
			$Time/Current_time.text = "DAY " + str(Global.day) + ": Morning"
			next_period = "Evening"
			$Time/Sprite.set_texture(morning)
		Global.Period.evening:
			$Time/Current_time.text = "DAY " + str(Global.day) + ": Evening"
			next_period = "Night"
			$Time/Sprite.set_texture(evening)
		Global.Period.night:
			$Time/Current_time.text = "DAY " + str(Global.day) + ": Night"
			next_period = "Morning"
			$Time/Sprite.set_texture(night)


func _on_Julie_pressed():
	$Selection_box.visible = true
	place_box("Julie", $Buttons/Julie.rect_position + Vector2(40,40))


func _on_Anna_pressed():
	$Selection_box.visible = true
	place_box("Anna", $Buttons/Anna.rect_position + Vector2(40,40))


func _on_Jen_pressed():
	$Selection_box.visible = true
	place_box("Jen", $Buttons/Jen.rect_position + Vector2(40,40))


func _on_Joseph_pressed():
	$Selection_box.visible = true
	place_box("Joseph", $Buttons/Joseph.rect_position + Vector2(40,40))


func _on_Castellan_pressed():
	$Selection_box.visible = true
	place_box("Castellan", $Buttons/Castellan.rect_position + Vector2(40,40))


func place_box(name, position):
	if Global.can_choose:
		Global.target = name
		$Selection_box.position = position


func _on_Request_pressed():
	if Global.target in Global.available_targets and Global.can_choose:
		Global.request_info()


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

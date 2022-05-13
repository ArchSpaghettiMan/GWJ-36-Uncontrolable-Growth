extends Control

export var Ending : PackedScene

#Global.minus_layer()
var morning = preload("res://Assets/Sprites/Morning-export.png")
var evening = preload("res://Assets/Sprites/Evening-export.png")
var night = preload("res://Assets/Sprites/Night-export.png")

var next_period 

var chosen_sprite = preload("res://Assets/Sprites/Report_choice.png")
var recent_path
var julie_path
var anna_path
var jen_path
var joseph_path
var castellan_path


func _ready():
	check_time()
	
	if Global.font == "Heveltica":
		update_font_heveltica()
	else:
		update_font_pony()


func _on_Cancel_pressed() -> void:
	var _unused_value = get_tree().change_scene(Global.prev_scene[-1])
	Global.prev_scene.pop_back()


func _process(_delta):
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
	Sound.accept()
	if julie_path == null:
		new_chosen_sprite($Buttons/Julie.rect_position + Vector2(40,40))
		julie_path = recent_path
	else:
		get_node(julie_path).queue_free()
		julie_path = null


func _on_Anna_pressed():
	if anna_path == null:
		new_chosen_sprite($Buttons/Anna.rect_position + Vector2(40,40))
		anna_path = recent_path
	else:
		get_node(anna_path).queue_free()
		anna_path = null


func _on_Jen_pressed():
	if jen_path == null:
		new_chosen_sprite($Buttons/Jen.rect_position + Vector2(40,40))
		jen_path = recent_path
	else:
		get_node(jen_path).queue_free()
		jen_path = null


func _on_Joseph_pressed():
	if joseph_path == null:
		new_chosen_sprite($Buttons/Joseph.rect_position + Vector2(40,40))
		joseph_path = recent_path
	else:
		get_node(joseph_path).queue_free()
		joseph_path = null


func _on_Castellan_pressed():
	if castellan_path == null:
		new_chosen_sprite($Buttons/Castellan.rect_position + Vector2(40,40))
		castellan_path = recent_path
	else:
		get_node(castellan_path).queue_free()
		castellan_path = null


func new_chosen_sprite(position):
	var sprite = Sprite.new()
	sprite.set_texture(chosen_sprite)
	sprite.scale = Vector2(5,5)
	sprite.global_position = position
	self.add_child(sprite)
	recent_path = sprite.get_path()


func _on_Report_pressed():
	#Endings for characters
	if julie_path != null: 
		Endings.ending.append(Endings.JULIE)
		Endings.riot_stopped = true
	if anna_path != null: Endings.ending.append(Endings.ANNA)
	if jen_path != null: Endings.ending.append(Endings.JEN)
	if joseph_path != null: Endings.ending.append(Endings.JOSEPH)
	if castellan_path != null: Endings.ending.append(Endings.CASTELLAN)
	
	#Endings for reporting no one
	if Endings.ending == []: Endings.ending.append(Endings.NOT_REPORTED)
	
	#Endings for riot stopped/not stopped
	if Endings.riot_stopped: Endings.ending.append(Endings.STOPPED)
	else: Endings.ending.append(Endings.NOT_STOPPED)
	
	var _unused_value = get_tree().change_scene_to(Ending)
	

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

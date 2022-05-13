extends Control
class_name Base

export var Report : PackedScene
export var Get_info : PackedScene
export var Settings : PackedScene

var morning = preload("res://Assets/Sprites/Morning-export.png")
var evening = preload("res://Assets/Sprites/Evening-export.png")
var night = preload("res://Assets/Sprites/Night-export.png")

var next_period 


func _ready():
	check_time()


func _process(_delta):
	#Check target selection state of target to change text of request button
	if !Global.can_choose:
		$Main_functions/Request_label.text = "REQUEST INFORMATION\r\n(Requesting information)"
		$Request_progress/Request_progress_2.text = str(int((Global.get_node("Request_timer").get_wait_time() - Global.get_node("Request_timer").get_time_left())/Global.get_node("Request_timer").get_wait_time() * 100)) +"%"
	elif Global.target != null and !Global.target in Global.available_targets and Global.can_choose:
		$Main_functions/Request_label.text = "REQUEST INFORMATION"
		$Request_progress/Request_progress_2.text = "Request Completed"

	check_time()
	$Time/Period_time.text = str(int(Global.get_node("Period_timer").get_time_left())) + " until " + next_period


func check_time():
	match Global.time:
		Global.Period.morning:
			$Time/Current_time.text = "8/" + str(Global.day) + "/1945" + ": Morning"
			next_period = "Evening"
			$Time/Sprite.set_texture(morning)
		Global.Period.evening:
			$Time/Current_time.text = "8/" + str(Global.day) + "/1945" + ": Evening"
			next_period = "Night"
			$Time/Sprite.set_texture(evening)
		Global.Period.night:
			$Time/Current_time.text = "8/" + str(Global.day) + "/1945" + ": Night"
			next_period = "Morning"
			$Time/Sprite.set_texture(night)


func _on_Report_pressed():
	var _unused_value = get_tree().change_scene_to(Report)
	save_prev_scene()


func _on_Request_pressed():
	var _unused_value = get_tree().change_scene_to(Get_info)
	save_prev_scene()


func _on_Return_pressed():
	var _unused_value = get_tree().change_scene(Global.prev_scene[-1])
	Global.minus_layer()


func _on_Settings_pressed():
	var _unused_value = get_tree().change_scene_to(Settings)
	save_prev_scene()


func save_prev_scene():
	var layer = self.get_script().get_path()
	layer = str(layer).replace("gd", "tscn")
	Global.prev_scene.append(layer)

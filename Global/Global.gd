extends Node2D

export var Ending : PackedScene
#Period time is 50 ; request is 90
var day
#For simple update conditions on News
var day_state

var prev_scene := []

var time : int
enum Period{
	morning
	evening
	night
}

var font = "Heveltica"

var Anna = false
var Castellan = false
var Jen = false
var Joseph = false
var Julie = false

var target
var available_targets = ['Julie','Anna','Jen','Joseph','Castellan']
var can_choose = true


var ambient_sound = false
var screen_flash = false


func _ready():
	day = 14
	time = Period.morning
	day_state = 10


func _on_Period_timer_timeout():
	match time:
		Period.morning:
			Sound.day_change()
			time = Period.evening
		Period.evening:
			time = Period.night
		Period.night:
			time = Period.morning
			day += 1
			if day == 17:
				Endings.ending.append(Endings.NOT_REPORTED)
				var _unused_value = get_tree().change_scene_to(Ending)
	
	day_state = str(day) + str(time)
	get_tree().call_group("time_update","time_update")
	$Period_timer.start()


func minus_layer():
	if prev_scene.size() > 1:
		Sound.accept()
		prev_scene.pop_back()


func request_info(): #Starts the request info clock --> change global variable to true 
	can_choose = false
	$Request_timer.start()


func _on_Request_timer_timeout():
	can_choose = true
	available_targets.erase(target)
	match target:
		"Julie":
			Julie = true
		"Anna":
			Anna = true
		"Jen":
			Jen = true
		"Castellan":
			Castellan = true
		"Joseph":
			Joseph = true

extends Node2D


func _input(_event):
	if Input.is_action_just_pressed("click"):
		$Click.play()


func day_change():
	$Day_change.play()


func accept():
	#Audio is very tiring oh god why did i think that this was easy
	pass


func _process(_delta):
	if !Global.ambient_sound:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -100)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 2)

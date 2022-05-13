extends Node2D

const JEN = "  Jen was an innocent girl but being under suspicion of being a heretic, she was brought far away and was never heard of again."
const JULIE = "  Julie was found to have been stealing nation’s weapon parts and hiding them under her jacket when going home to help the riot having weapons to fight back against the government. She was also found responsible for the duplicable graffiti a few days earlier. Of course, she was given the death sentence after being interrogated."
const ANNA = "  Anna was just a name that she used in the process of her infiltration and spying on the country for Eurasia, she was tasked with the responsibility of reporting the state of Oceania for the best time to be attacked. She was taken to the Department for further interrogation."
const JOSEPH = "  Despite Joseph being a promising student that has expressed remarkable abilities in architecture, he was found affiliated with a student movement organization. Thus, he was expelled from school and brought to a labor camp in the far West. None ever saw him again, even when the day that he was supposed to be released came."
const CASTELLAN = "  Castellan was found guilty of buying and gathering parts of weapon from the black market. He was trying to assemble them with a group of his friends to rob a nearby bank to find enough money for food and further heists. He was immediately given the death sentence."
const NOT_STOPPED = "  The riot is not stopped. It caused all hell in Oceania. In combination with the constant pressure of the attacks from the neighbour country, Eusasia, Oceania is devastated."
const STOPPED = "  With the riot being stopped, Oceania was able to subdue riots from other areas, while standing their ground against a surprise attack from their neighbor country, Eurasia being supplied with their numerous information sources. However, such circumstances still left them coming out severely weakened, which is only precious times for even more riots to happen."
const NOT_REPORTED = "  The riot is not stopped. Along with social movements, society vices, and riots from other areas, it caused all hell in Oceania. In combination with the constant pressure of the attacks from the neighbor country, Eurasia being supplied with their numerous information sources, Oceania is devastated and no longer a country."

var riot_stopped = false

var ending = []


func reset_game():
	ending = []
	riot_stopped = false
	Global.day = 14
	Global.time = Global.Period.morning
	Global.day_state = 10
	Global.prev_scene = []
	var _unused_value = get_tree().change_scene("res://Scenes/Menus/Start_screen.tscn")

extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		print(self.name)
	
	# Stop the event from spreading
	#get_viewport().set_input_as_handled()
	
	# Seems to never change
	# root:<Window#26239567101>
	#print(get_viewport())

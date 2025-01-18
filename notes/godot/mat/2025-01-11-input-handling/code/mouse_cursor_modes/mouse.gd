extends Node

## Inspired by https://kidscancode.org/godot_recipes/4.x/input/mouse_capture/index.html

var movement_speed: float = 1.0
const SPEED_STEP: float = 0.1
const MIN_SPEED: float = 0.1
const MAX_SPEED: float = 5.0

var smoothed_delta: Vector2 = Vector2.ZERO
const SMOOTHING_FACTOR: float = 0.7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_viewport().set_input_as_handled()

	if event.is_action_pressed("click"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			get_viewport().set_input_as_handled()
	
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		var delta = event.relative * movement_speed # Relative movement since the last frame
		# var speed = event.velocity # Velocity of the mouse movement
		move_sprite(delta)
		
		#print("Mouse moved with relative: ", delta, " and velocity: ", speed)
	
	if event is InputEventMouseButton:
		handle_mouse_wheel(event)
		
func move_sprite(delta: Vector2):
	smoothed_delta = smoothed_delta.lerp(delta, SMOOTHING_FACTOR)
	var sprite = %Sprite2D
	sprite.position += smoothed_delta  * get_process_delta_time()

func handle_mouse_wheel(event: InputEventMouseButton) -> void:
	if event.button_index == MOUSE_BUTTON_WHEEL_UP:
		movement_speed = clamp(movement_speed + SPEED_STEP, MIN_SPEED, MAX_SPEED)
		print("Speed increased to: ", movement_speed)
	elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		movement_speed = clamp(movement_speed - SPEED_STEP, MIN_SPEED, MAX_SPEED)
		print("Speed decreased to: ", movement_speed)

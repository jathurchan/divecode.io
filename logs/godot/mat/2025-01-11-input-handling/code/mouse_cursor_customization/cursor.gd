extends Node


var arrow_texture = preload("res://cursor.png")

func _ready():
	
	get_window().unresizable = true
	
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	var resized_texture = resize_cursor(arrow_texture, Vector2(32, 32))
	
	Input.set_custom_mouse_cursor(resized_texture, Input.CURSOR_ARROW, Vector2(8, 8))

func resize_cursor(original_texture: Texture2D, new_size: Vector2) -> Texture2D:
	var image = original_texture.get_image()
	image.resize(new_size.x, new_size.y, Image.INTERPOLATE_NEAREST)
	var resized_texture = ImageTexture.create_from_image(image)
	return resized_texture

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode != Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if event.is_action_pressed("click"):
		if Input.mouse_mode != Input.MOUSE_MODE_CONFINED:
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED

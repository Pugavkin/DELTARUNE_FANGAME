//start save
if (image_index % 4 == 0 and keyboard_check_pressed(ord("Z")) and !instance_exists(obj_fade)) {
	var f = instance_create_depth(0, 0, -9999, obj_fade)
	f.target_rm = global.start_room
	f.target_x = global.start_x
	f.target_y = global.start_y
	f.face = global.start_face
	global.new_game = false
}

if (image_index % 4 == 2 and keyboard_check_pressed(ord("Z"))) {
	image_index = (image_index + 4) % 8
	global.language = 1 - global.language
}

if (image_index % 4 == 3 and keyboard_check_pressed(ord("Z"))) {
	game_end()
}
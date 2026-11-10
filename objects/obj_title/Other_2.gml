//variables
global.start_room = rm_test_2
global.start_x = 300
global.start_y = 175
global.start_face = 3

global.new_game = false
global.title_buttons = 0
global.language = 0

if (file_exists("pugarune.ini")) {
	ini_open("pugarune.ini")
	var rm_name = ini_read_string("save1", "rm", "")
	global.start_x = ini_read_real("save1", "x", 300)
	global.start_y = ini_read_real("save1", "y", 175)
	global.start_face = ini_read_real("save1", "face", 3)
	global.language = ini_read_real("save1", "language", 0)
	ini_close()
	
	obj_buttons.image_index = global.language * 4
	var rm_id = asset_get_index(rm_name)
	if (rm_id != -1 and room_exists(rm_id)) global.start_room = rm_id
}
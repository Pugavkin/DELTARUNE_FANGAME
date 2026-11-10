#macro SAVE_FILE "pugarune.ini"
#macro NAME_MAX 8
#macro START_ROOM rm_test_1
#macro START_X 160
#macro START_Y 120

// перевод: 0 = русский, 1 = английский
function tr(_ru, _en) { return (global.lang == 0) ? _ru : _en }

// текст с тенью (чёрная копия на 1 px вниз-влево)
function draw_text_s(_x, _y, _str, _col = c_white) {
	draw_set_color(c_black)
	draw_text(_x - 1, _y + 1, _str)
	draw_set_color(_col)
	draw_text(_x, _y, _str)
}

function time_str(_sec) {
	var s = floor(_sec)
	var m = (s mod 3600) div 60
	var c = s mod 60
	return string(s div 3600) + ":" + string_replace_all(string_format(m, 2, 0), " ", "0")
		+ ":" + string_replace_all(string_format(c, 2, 0), " ", "0")
}

// названия локаций (добавляй новые комнаты сюда)
function room_title(_name) {
	switch (_name) {
		case "rm_test_1": return tr("Тестовая комната 1", "Test room 1")
		case "rm_test_2": return tr("Тестовая комната 2", "Test room 2")
	}
	return _name
}

function save_exists() {
	ini_open(SAVE_FILE)
	var r = ini_key_exists("save1", "room_name")
	ini_close()
	return r
}

function save_read() {
	ini_open(SAVE_FILE)
	var s = {
		name: ini_read_string("save1", "name", ""),
		room_name: ini_read_string("save1", "room_name", ""),
		x: ini_read_real("save1", "x", START_X),
		y: ini_read_real("save1", "y", START_Y),
		face: ini_read_real("save1", "face", 3),
		time: ini_read_real("save1", "time", 0)
	}
	ini_close()
	return s
}

function save_write(_room_name, _x, _y, _face) {
	ini_open(SAVE_FILE)
	ini_write_string("save1", "name", global.player_name)
	ini_write_string("save1", "room_name", _room_name)
	ini_write_real("save1", "x", _x)
	ini_write_real("save1", "y", _y)
	ini_write_real("save1", "face", _face)
	ini_write_real("save1", "time", global.playtime)
	ini_close()
}

function save_game() {
	if (!instance_exists(obj_player)) return
	save_write(room_get_name(room), obj_player.x, obj_player.y, obj_player.face)
}

function save_erase() {
	ini_open(SAVE_FILE)
	ini_section_delete("save1")
	ini_close()
}

function fade_to(_rm, _x, _y, _face) {
	if (instance_exists(obj_fade)) return
	var f = instance_create_depth(0, 0, -9999, obj_fade)
	f.target_x = _x
	f.target_y = _y
	f.target_rm = _rm
	f.face = _face
}
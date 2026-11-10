if (place_meeting(x, y, obj_player)) {
	if (!saved) {
		saved = true
		ini_open("pugarune.ini")
		ini_write_string("save1", "rm", room_get_name(room))
		ini_write_real("save1", "x", obj_player.x)
		ini_write_real("save1", "y", obj_player.y)
		ini_write_real("save1", "face", obj_player.face)
		ini_write_real("save1", "language", global.language)
		ini_close()
	}
} else {
	saved = false
}
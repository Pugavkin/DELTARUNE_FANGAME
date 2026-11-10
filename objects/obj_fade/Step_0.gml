if (phase == 1 and room == target_rm) {
	if (!moved) {
		moved = true
		if (!instance_exists(obj_player)) instance_create_depth(target_x, target_y, 0, obj_player)
		obj_player.x = target_x
		obj_player.y = target_y
		obj_player.face = face
		obj_player.sprite_index = obj_player.spr_face[face]
		obj_player.image_index = 0
	}
	if (image_index < 1) instance_destroy()
}
//controls
var down_key = keyboard_check(vk_down)
var left_key = keyboard_check(vk_left)
var right_key = keyboard_check(vk_right)
var up_key = keyboard_check(vk_up)

//movement
if (keyboard_check(vk_shift) or keyboard_check(ord("X"))) {
	move_spd = 2 * walk_spd
} else {
	move_spd = walk_spd
}

if (left_key) {
	xspd = -move_spd
} else if (right_key) {
	xspd = +move_spd
} else {
	xspd = 0
}

if (up_key) {
	yspd = -move_spd
} else if (down_key) {
	yspd = +move_spd
} else {
	yspd = 0
}

//collision
while (xspd != 0) {
	if (!place_meeting(x + xspd, y, obj_collider)) {
		break;
	}
	xspd = sign(xspd) * (abs(xspd) - 1)
}
x += xspd

while (yspd != 0) {
	if (!place_meeting(x, y + yspd, obj_collider)) {
		break;
	}
	yspd = sign(yspd) * (abs(yspd) - 1)
}
y += yspd

//animate
if (xspd != 0 or yspd != 0) {
	var h = (xspd > 0)
	var v = (yspd > 0) ? 3 : 2
	var nd = (yspd == 0) ? h : ((xspd == 0 or (face != h and face != v)) ? v : face)
	if (nd != face or !moving) {
		face = nd
		image_index = 1
	}
	moving = true
	sprite_index = spr_face[face]
	image_speed = 1 * move_spd / walk_spd
} else {
	moving = false
	image_speed = 0
	image_index = 0
}
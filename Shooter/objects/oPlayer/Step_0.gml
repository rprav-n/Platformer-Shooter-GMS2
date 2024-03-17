// Get Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

if (key_left || key_right || key_jump) {
	controller = 0;
}

if (abs(gamepad_axis_value(0, gp_axislh)) > 0.3 ) {
	key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
	key_right = max(gamepad_axis_value(0, gp_axislh), 0);
	controller = 1;
}

if (gamepad_button_check_pressed(0, gp_face1)) {
	key_jump = 1;
	controller = 1;
}

// Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;
vsp += grv;

if (place_meeting(x, y+1, oWall) && key_jump) {
	vsp = jumpsp;
}

// Horizontal Collision
if (place_meeting(x+hsp, y, oWall)) {
	var onepixel = sign(hsp);
	while(!place_meeting(x+onepixel, y, oWall)) {
		x += onepixel;
	}
	hsp = 0;
}
x += hsp;

// Vertical Collision
if (place_meeting(x, y+vsp, oWall)) {
	var onepixel = sign(vsp);
	while(!place_meeting(x, y+onepixel, oWall)) {
		y += onepixel;
	}
	vsp = 0;
}
y += vsp;


// Animations
if (hsp != 0) {
	image_xscale = sign(hsp);
}
if (!place_meeting(x, y+1, oWall)) {
	sprite_index = sPlayerAir;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;
	else image_index = 0;
} else {
	if (hsp == 0) {
		image_speed = 0;
		sprite_index = sPlayer;
	} else {
		image_speed = 1;
		sprite_index = sPlayerRun;
	}
}






























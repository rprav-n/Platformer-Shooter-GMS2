// Get Player Input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

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
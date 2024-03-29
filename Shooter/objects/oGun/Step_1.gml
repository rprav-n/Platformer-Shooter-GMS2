x = oPlayer.x;
y = oPlayer.y+10;

if (oPlayer.controller == 0) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
} else {
	var controllerh = gamepad_axis_value(0, gp_axisrh);
	var controllerv = gamepad_axis_value(0, gp_axisrv);
	
	if (abs(controllerh) > 0.2 || abs(controllerv) > 0.2) {
		controllerangle = point_direction(0, 0, controllerh, controllerv);
	}
	
	image_angle = controllerangle;
}

firingdelay = max(0, firingdelay-1);
recoil = max(0, recoil-1);
if (mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && (firingdelay <= 0) {
	firingdelay = 5;
	recoil = 4;
	screenShake(2, 10);
	audio_sound_pitch(sndShoot, random_range(0.8, 1.2));
	audio_play_sound(sndShoot, 1, 0);
	var _bullet = instance_create_layer(x, y, "Bullets", oBullet);
	with (_bullet) {
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}
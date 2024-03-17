
// Calculate Movement
hsp = dir * walksp;
vsp += grv;


// Horizontal Collision
if (place_meeting(x+hsp, y, oWall)) {
	var onepixel = sign(hsp);
	while(!place_meeting(x+onepixel, y, oWall)) {
		x += onepixel;
	}
	dir *= -1;
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
	sprite_index = sEnemyAir;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1;
	else image_index = 0;
} else {
	if (hsp == 0) {
		image_speed = 0;
		sprite_index = sEnemy;
	} else {
		image_speed = 1;
		sprite_index = sEnemyRun;
	}
}

if (hp <= 0) {
	with(instance_create_layer(x, y, "Enemies", oEnemyDead)) {
		direction = other.hitfrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction) - 2;
		if (hsp != 0) image_xscale = sign(hsp);
	}
	instance_destroy();
}




























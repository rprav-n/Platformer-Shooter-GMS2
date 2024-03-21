if (done == 0) {
	vsp += grv;

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
		done = 1;
		image_index = 1;
		alarm[0] = 60;
		vsp = 0;
	}
	y += vsp;
}


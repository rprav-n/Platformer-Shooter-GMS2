/// @description screenShake(magnitude, frame);
/// @arg magnitude sets the strength of the shake
/// @arg frame sets the length of the shake in frames (60 = 1 sec)

function screenShake(_magnitude, _frame){
	
	with (oCamera) {
		if (_magnitude > shake_remain) {
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frame;
		}
	}

}
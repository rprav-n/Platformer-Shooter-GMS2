/// @description slideTransition(mode, target_room);
/// @arg mode sets transition mode b/w next, restart and goto
/// @arg traget_room sets target room when using the goto mode

function slideTransition(_mode, _target_room=room) {
	
	with(oTransition) {
		mode = _mode;
		target = _target_room;
	}
}
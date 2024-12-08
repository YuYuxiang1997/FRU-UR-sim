/// @description Insert description here
// You can write your code in this editor
function step_time() {
	return play_speed*delta_time/1000000
}


if (state == 1) {
	if (global_time == 0) {
		init_mech()
	}
	if (floor(global_time) != floor(global_time+step_time())) {
		var _failure = discrete_failure_check(floor(global_time+step_time()))
		if (_failure != undefined) {
			array_push(failures, _failure)
		}
	}
	global_time += step_time()
}

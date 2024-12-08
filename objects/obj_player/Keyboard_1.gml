/// @description Insert description here
// You can write your code in this editor
var _move_vec = [0,0]
if (keyboard_check(ord("A"))) {
	_move_vec[1] -= 1
}
if (keyboard_check(ord("S"))) {
	_move_vec[0] -= 1
}
if (keyboard_check(ord("D"))) {
	_move_vec[1] += 1
}
if (keyboard_check(ord("W"))) {
	_move_vec[0] += 1
}

if (Obj_camera.global_time > 51 && Obj_camera.global_time<54) {
	return
}

if (_move_vec[0]*_move_vec[1] != 0) {
	_move_vec = [_move_vec[0]/1.414,_move_vec[1]/1.414]
}

var _to_move = get_forward_vector()

x += Obj_camera.step_time()*MOVESPEED*(_move_vec[0]*_to_move[0] + _move_vec[1]*_to_move[1])
y += Obj_camera.step_time()*MOVESPEED*(_move_vec[0]*_to_move[1] - _move_vec[1]*_to_move[0])
/// @description Insert description here
// You can write your code in this editor
event_inherited()

#macro MOVESPEED 200

if (Obj_camera.global_time > 54) {
	walk_path = [[54,room_width/2,room_height/2]]
}

if (array_length(walk_path) == 0) {
	return
}

//If reached, finish current dest
if (point_distance(x,y,walk_path[0][1],walk_path[0][2]) < 10) {
	array_delete(walk_path,0,1)
}

if (array_length(walk_path) == 0) {
	return
}

if (Obj_camera.global_time > walk_path[0][0]) {
	var _dir = [walk_path[0][1]-x,walk_path[0][2]-y]
	var _r = sqrt(_dir[0]*_dir[0]+_dir[1]*_dir[1])
	_dir = [_dir[0]/_r,_dir[1]/_r]
	
	x += Obj_camera.step_time()*MOVESPEED*_dir[0]
	y += Obj_camera.step_time()*MOVESPEED*_dir[1]
}
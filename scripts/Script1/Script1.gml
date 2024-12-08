// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro PI 3.14159265358979323846264338327950
#macro DISTANCE 395.72

function cart_2_sphere(_x, _y, _z) {
	var _r = sqrt(_x*_x+_y*_y+_z*_z)
	var _theta;
	if (_x < 0 && _y < 0) {
		_theta = -PI/2 - arctan(_x/_y)
	} else if (_x < 0 && _y > 0) {
		_theta = PI/2 + arctan(-1*_x/_y)
	} else {
		_theta = arctan(_y/_x)
	}
	return [
			_r, 
			_theta, 
			arccos(_z/_r)
	]
}

function sphere_2_cart(_r, _theta, _phi) {
	return [
		_r*sin(_phi)*cos(_theta),
		_r*sin(_phi)*sin(_theta),
		_r*cos(_phi)
	]
}

function move(_movx,_movy) {
	var dir_vec = [saved_camera_x-lookx, saved_camera_y-looky, saved_camera_z-lookz]
	var sphere_coord = cart_2_sphere(dir_vec[0], dir_vec[1], dir_vec[2])
	sphere_coord[1] += _movx/360
	sphere_coord[2] += _movy/360
	if (sphere_coord[2] > 1.4) {
		sphere_coord[2] = 1.4
	} else if (sphere_coord[2] < 0) {
		sphere_coord[2] = 0.1
	}
	sphere_coord[0] = DISTANCE
	var new_dir_vec = sphere_2_cart(sphere_coord[0], sphere_coord[1], sphere_coord[2])
	x = lookx + new_dir_vec[0]
	y = looky + new_dir_vec[1]
	z = lookz + new_dir_vec[2]
}

function get_forward_vector() {
	var t = [Obj_camera.lookx-Obj_camera.x, Obj_camera.looky-Obj_camera.y]
	var r = sqrt(t[0]*t[0]+t[1]*t[1])
	return [t[0]/r,t[1]/r]
}
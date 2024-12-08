/// @description Insert description here
// You can write your code in this editor
#macro TOTAL_ROT 120

function check_laser_failure(_angle,_x,_y) {
	if (array_contains(Obj_camera.failures,"Shot by laser")) {
		return
	}
	var _player_vec = [obj_player.x-_x,obj_player.y-_y]
	var _shot_vec = [cos(_angle),sin(_angle)]
	var _dot_prod = dot_product(_player_vec[0],_player_vec[1],_shot_vec[0],_shot_vec[1])/dot_product(_shot_vec[0],_shot_vec[1],_shot_vec[0],_shot_vec[1])
	if (_dot_prod < 0) {
		//Behind, return
		return
	}
	var _proj_vec = [_dot_prod*_shot_vec[0],_dot_prod*_shot_vec[1]]
	var _orth_vec = [_player_vec[0]-_proj_vec[0],_player_vec[1]-_proj_vec[1]]
	if (sqrt(_orth_vec[0]*_orth_vec[0]+_orth_vec[1]*_orth_vec[1]) < 25) {
		array_push(Obj_camera.failures, "Shot by laser")
	}
}

function check_laser_bait_failure(_cw,_x,_y) {
	var _player_vec = [obj_player.x-(room_width/2),obj_player.y-(room_height/2)]
	var _tower_vec = [_x-(room_width/2),_y-(room_height/2)]
	//Check if player is cw of tower
	var _t = _player_vec[0]*-1*_tower_vec[1]+_player_vec[1]*_tower_vec[0] < 0
	if (_t ^^ _cw) {
		array_push(Obj_camera.failures, "Bad laser bait")
	}
}

function get_angle_to_closest(_x,_y) {
	var _dist_to_npc = function (_npc) {
		return point_distance(x,y,_npc.x,_npc.y)
	}
	var _play_dist = point_distance(_x,_y,obj_player.x,obj_player.y)
	var _nearest = -1
	var _nearest_val = _play_dist
	var _npc_dist = array_map(Obj_camera.character_instances, _dist_to_npc)
	for (var _i = 0; _i < 7; _i ++) {
		if (_npc_dist[_i] < _nearest_val) {
			_nearest_val = _npc_dist[_i]
			_nearest = _i
		}
	}
	
	var dir
	var _bait_loc
	var _is_player = false
	if (_nearest == -1) {
		dir = [obj_player.x-_x,obj_player.y-_y]
		_bait_loc = [obj_player.x-(room_width/2),obj_player.y-(room_height/2)]
		_is_player = true
	} else {
		dir = [Obj_camera.character_instances[_nearest].x-_x,Obj_camera.character_instances[_nearest].y-_y]
		_bait_loc = [Obj_camera.character_instances[_nearest].x-(room_width/2),Obj_camera.character_instances[_nearest].y-(room_height/2)]
	}
	
	
	var _theta
	if (dir[0] < 0 && dir[1] < 0) {
		_theta = -PI/2 - arctan(dir[0]/dir[1])
	} else if (dir[0] < 0 && dir[1] > 0) {
		_theta = PI/2 + arctan(-1*dir[0]/dir[1])
	} else {
		_theta = arctan(dir[1]/dir[0])
	}
	return [_theta,_is_player,sqrt(_bait_loc[0]*_bait_loc[0]+_bait_loc[1]*_bait_loc[1])]
}
var _total_rot = 2*PI*TOTAL_ROT/360

if (Obj_camera.state == 0) {
	return
}

switch (order) {
	case 0:
		if (!locked_in && Obj_camera.global_time > 27) {
			var _res = get_angle_to_closest(x,y)
			shot_angle = _res[0]
			locked_in = true
			if (_res[1]) {
				check_laser_bait_failure(clockwise,x,y)
			}
			if (_res[2] < 0.95*TOWER_DISTANCE) {
				array_push(Obj_camera.failures, "Bad laser bait too close") 
			}
		}
		if (Obj_camera.global_time > 30 && Obj_camera.global_time < 39) {
			shot_angle += (clockwise ? 1 : -1)*_total_rot*Obj_camera.step_time()/9
			check_laser_failure(shot_angle,x,y)
		}
		break
	case 1:
		if (!locked_in && Obj_camera.global_time > 37) {
			var _res = get_angle_to_closest(x,y)
			shot_angle = _res[0]
			locked_in = true
			if (_res[1]) {
				check_laser_bait_failure(clockwise,x,y)
			}
			if (_res[2] < 0.95*TOWER_DISTANCE) {
				array_push(Obj_camera.failures, "Bad laser bait too close") 
			}
		}
		if (Obj_camera.global_time > 40 && Obj_camera.global_time < 49) {
			shot_angle += (clockwise ? 1 : -1)*_total_rot*Obj_camera.step_time()/9
			check_laser_failure(shot_angle,x,y)
		}
		break
	case 2:
		if (!locked_in && Obj_camera.global_time > 49) {
			var _res = get_angle_to_closest(x,y)
			shot_angle = _res[0]
			locked_in = true
			if (_res[1]) {
				check_laser_bait_failure(clockwise,x,y)
			}
			if (_res[2] < 0.95*TOWER_DISTANCE) {
				array_push(Obj_camera.failures, "Bad laser bait too close") 
			}
		}
		if (Obj_camera.global_time > 52 && Obj_camera.global_time < 61) {
			shot_angle += (clockwise ? 1 : -1)*_total_rot*Obj_camera.step_time()/9
			check_laser_failure(shot_angle,x,y)
		}
		break
}


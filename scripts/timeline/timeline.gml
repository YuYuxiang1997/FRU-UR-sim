enum DEBUFF_ROLE {
	SUPPORT_LONG_FIRE,
	SUPPORT_LONG_FIRE_UNHOLY,
	SUPPORT_MED_FIRE,
	SUPPORT_SHORT_FIRE,
	SUPPORT_ICE,
	DPS_SHORT_FIRE_LONG_UNHOLY,
	DPS_SHORT_FIRE_MED_UNHOLY,
	DPS_MED_FIRE,
	DPS_LONG_FIRE,
	DPS_ICE,
}

#macro FIRE_AOE 200
#macro ERUPTION_AOE 150
#macro ICE_AOE_OUTER 200
#macro ICE_AOE_INNER 100
#macro UNHOLY_AOE 100
#macro WATER_AOE 100
#macro DEBUFF_LINGER 0.5

#macro TOWER_DISTANCE 300

function draw_debuff(_buffer,_sprite,_expire_time,_x,_y,_time){
	draw_sprite(_sprite,-1,_x+_buffer,_y)
	draw_text(_x+_buffer,_y+30,floor(_expire_time-_time))
	return _buffer + 30;
}

function draw_gui(_time,_x,_y,_debuff_role) {
	var _x_buff = 0
	if (_time < 12 ) {
		return;
	}
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
			//Fire
			if (_time < 42) {
				_x_buff = draw_debuff(_x_buff,spr_fire,42,_x,_y,_time)
			}
			//Rewind
			if (_time <37) {
				_x_buff = draw_debuff(_x_buff,spr_return,37,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Shadoweye
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_shadoweye,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
			//Fire
			if (_time < 42) {
				_x_buff = draw_debuff(_x_buff,spr_fire,42,_x,_y,_time)
			}
			//Rewind
			if (_time <37) {
				_x_buff = draw_debuff(_x_buff,spr_return,37,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Shadoweye
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_shadoweye,54,_x,_y,_time)
			}
			//stack
			if (_time < 22) {
				_x_buff = draw_debuff(_x_buff,spr_unholy,22,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
			//Fire
			if (_time < 32) {
				_x_buff = draw_debuff(_x_buff,spr_fire,32,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Eruption
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_eruption,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
			//Fire
			if (_time < 22) {
				_x_buff = draw_debuff(_x_buff,spr_fire,22,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Eruption
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_eruption,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.SUPPORT_ICE:
			//Ice
			if (_time < 32) {
				_x_buff = draw_debuff(_x_buff,spr_ice,32,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Eruption
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_eruption,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.DPS_LONG_FIRE:
			//Fire
			if (_time < 42) {
				_x_buff = draw_debuff(_x_buff,spr_fire,42,_x,_y,_time)
			}
			//Rewind
			if (_time <37) {
				_x_buff = draw_debuff(_x_buff,spr_return,37,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Shadoweye
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_shadoweye,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.DPS_MED_FIRE:
			//Fire
			if (_time < 32) {
				_x_buff = draw_debuff(_x_buff,spr_fire,32,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Water
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_water,54,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
			//Fire
			if (_time < 22) {
				_x_buff = draw_debuff(_x_buff,spr_fire,22,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Eruption
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_eruption,54,_x,_y,_time)
			}
			//stack
			if (_time < 42) {
				_x_buff = draw_debuff(_x_buff,spr_unholy,42,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
			//Fire
			if (_time < 22) {
				_x_buff = draw_debuff(_x_buff,spr_fire,22,_x,_y,_time)
			}
			//Rewind
			if (_time <27) {
				_x_buff = draw_debuff(_x_buff,spr_return,27,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Eruption
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_eruption,54,_x,_y,_time)
			}
			//stack
			if (_time < 32) {
				_x_buff = draw_debuff(_x_buff,spr_unholy,32,_x,_y,_time)
			}
			break
		case DEBUFF_ROLE.DPS_ICE:
			//ice
			if (_time < 32) {
				_x_buff = draw_debuff(_x_buff,spr_ice,32,_x,_y,_time)
			}
			//Rewind
			if (_time <37) {
				_x_buff = draw_debuff(_x_buff,spr_return,37,_x,_y,_time)
			} else if (_time < 51) {
				_x_buff = draw_debuff(_x_buff,spr_rewind,51,_x,_y,_time)
			}
			//Shadoweye
			if (_time < 54) {
				_x_buff = draw_debuff(_x_buff,spr_shadoweye,54,_x,_y,_time)
			}
			break
	}
}

function draw_ui(_time,_x,_y,_rewx,_rewy,_debuff_role) {
	//Fires
	draw_set_color(c_red)
	draw_set_alpha(0.8)
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
			if (_time > 22 && _time < 22+DEBUFF_LINGER) {
				//fire
				draw_circle(_x,_y,FIRE_AOE,false)
			}
			break
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
		case DEBUFF_ROLE.DPS_MED_FIRE:
			if (_time > 32 && _time < 32+DEBUFF_LINGER) {
				//fire
				draw_circle(_x,_y,FIRE_AOE,false)
			}
			break
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
		case DEBUFF_ROLE.DPS_LONG_FIRE:
			if (_time > 42 && _time < 42+DEBUFF_LINGER) {
				//fire
				draw_circle(_x,_y,FIRE_AOE,false)
			}
			break			
		default:
			break
	}
	//Ice
	if (_time > 32 && _time < 32+DEBUFF_LINGER && (_debuff_role == DEBUFF_ROLE.SUPPORT_ICE || _debuff_role == DEBUFF_ROLE.DPS_ICE)) {
		draw_set_color(c_teal)
		draw_circle(_x,_y,ICE_AOE_OUTER,false)
		draw_set_color(c_white)
		draw_circle(_x,_y,ICE_AOE_INNER,false)
	}
	//Unholy
	draw_set_color(c_purple)
	if (_time > 22 && _time < 22+DEBUFF_LINGER && _debuff_role == DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY) {
		//stack
		draw_circle(_x,_y,UNHOLY_AOE,false)
	}
	if (_time > 32 && _time < 32+DEBUFF_LINGER && _debuff_role == DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY) {
		//stack
		draw_circle(_x,_y,UNHOLY_AOE,false)
	}
	if (_time > 42 && _time < 42+DEBUFF_LINGER && _debuff_role == DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY) {
		//stack
		draw_circle(_x,_y,UNHOLY_AOE,false)
	}
	//Water
	if (_time > 54 && _time < 54+2*DEBUFF_LINGER && _debuff_role == DEBUFF_ROLE.DPS_MED_FIRE) {
		//water
		draw_set_color(c_navy)
		draw_circle(_x,_y, WATER_AOE,false)
	}
	//Eruption+eye+water
	if (_time> 54 && _time < 54+2*DEBUFF_LINGER) {
		switch (_debuff_role) {
			case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
			case DEBUFF_ROLE.SUPPORT_ICE:
			case DEBUFF_ROLE.SUPPORT_MED_FIRE:
			case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
			case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
				draw_set_color(c_black)
				draw_circle(_x,_y, ERUPTION_AOE,false)
				break
			case DEBUFF_ROLE.DPS_MED_FIRE:
				draw_set_color(c_navy)
				draw_circle(_x,_y, WATER_AOE,false)
				break
			case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
			case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
			case DEBUFF_ROLE.DPS_LONG_FIRE:
			case DEBUFF_ROLE.DPS_ICE:
				draw_sprite(spr_gaze, -1, _x+25, _y+25)
				break
		}
	}
	//Rewind
	draw_set_color(c_blue)
	draw_set_alpha(0.3)
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
		case DEBUFF_ROLE.SUPPORT_ICE:
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
		case DEBUFF_ROLE.DPS_MED_FIRE:
			if (_time > 27 && _time < 51) {
				//Rewind
				draw_set_color(c_blue)
				draw_set_alpha(0.3)
				draw_circle(_rewx,_rewy,50,false)
			}
			break
		default:
			if (_time > 37 && _time < 51) {
				//Rewind
				draw_set_color(c_blue)
				draw_set_alpha(0.3)
				draw_circle(_rewx,_rewy,50,false)
			}
			break
	}
	draw_set_color(c_white)
	draw_set_alpha(1)
	if (Obj_camera.global_time > 59 && Obj_camera.global_time < 59 + DEBUFF_LINGER) {
		draw_set_alpha(0.5)
		draw_set_color(c_white)
		draw_circle(room_width/2,room_height/2,UNHOLY_AOE,false)
		draw_set_alpha(1)
	}
}

function init_mech() {
	show_debug_message("init called")
	randomize()
	var _player_dps = Obj_camera.role == "DPS"
	var _t_ins
	//Assign debuffs
	var _dps_ice = random(2) >= 1
	var _support_debuff_roles = array_shuffle([
		DEBUFF_ROLE.SUPPORT_LONG_FIRE,
		DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY,
		DEBUFF_ROLE.SUPPORT_MED_FIRE,
		_dps_ice ? DEBUFF_ROLE.SUPPORT_SHORT_FIRE : DEBUFF_ROLE.SUPPORT_ICE
	])
	var _dps_debuff_roles = array_shuffle([
		DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY,
		DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY,
		DEBUFF_ROLE.DPS_MED_FIRE,
		_dps_ice ? DEBUFF_ROLE.DPS_ICE : DEBUFF_ROLE.DPS_LONG_FIRE,
	])
	if (_player_dps) {
		obj_player.debuff_role = _dps_debuff_roles[0]
		array_delete(_dps_debuff_roles,0,1)
	} else {
		obj_player.debuff_role = _support_debuff_roles[0]
		array_delete(_support_debuff_roles,0,1)
	}
	var _npc_debuffs = array_concat(_support_debuff_roles,_dps_debuff_roles)
	//Create NPCs
	for (var _i = 0; _i < 7; _i++) {
		//MAKE THIS NICER LATER MAYBE
		_t_ins = instance_create_layer(room_width/2-450+150*_i,room_height/2-300,"Instances_1",obj_npc)
		if (_i <= 1) { 
			_t_ins.sprite_index = spr_tank
		}  else if (_i >= 4) {
			_t_ins.sprite_index = spr_dps
		} else if (_i == 2) {
			_t_ins.sprite_index = spr_healer
		} else if (_i == 3) {
			_t_ins.sprite_index = _player_dps ? spr_healer : spr_dps
		}
		_t_ins.depth = -1
		_t_ins.character_id = _i+1
		_t_ins.debuff_role = _npc_debuffs[_i]
		array_push(Obj_camera.character_instances, _t_ins)
	}
	//Create Towers
	var _rand = floor(random(8)) //orientation
	var _directions = []
	var _cws = []
	for (var _i = 0; _i < 8; _i++) {
		var _theta = ((_i+_rand) % 8)*2*PI/8
		array_push(_directions,_theta)
		var _x = TOWER_DISTANCE*cos(_theta)
		var _y = TOWER_DISTANCE*sin(_theta)
		_t_ins = instance_create_layer((room_width/2)+_x,(room_height/2)+_y,"Instances_1",obj_tower)
		_t_ins.depth = -3
		if (_i == 1 || _i ==4 || _i ==7) {
			_t_ins.order = 0
		} else if (_i == 2 || _i == 6) {
			_t_ins.order = 2
		} else {
			_t_ins.order = 1 
		}
		_t_ins.clockwise = random(2) >= 1
		array_push(_cws,_t_ins.clockwise)
		array_push(Obj_camera.tower_instances,_t_ins)
	}
	//Create NPC ai
	var _angle
	var _cw
	for (var _i = 0; _i < 7; _i++) {
		switch (Obj_camera.character_instances[_i].debuff_role) {
			case DEBUFF_ROLE.SUPPORT_ICE:
			case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
				_angle = _directions[0]
				_cw = _cws[0]
				break
			case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
				_angle = _directions[1]
				_cw = _cws[1]
				break
			case DEBUFF_ROLE.DPS_MED_FIRE:
				_angle = _directions[2]
				_cw = _cws[2]
				break
			case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
				_angle = _directions[3]
				_cw = _cws[3]
				break
			case DEBUFF_ROLE.DPS_LONG_FIRE:
			case DEBUFF_ROLE.DPS_ICE:
				_angle = _directions[4]
				_cw = _cws[4]
				break
			case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
				_angle = _directions[5]
				_cw = _cws[5]
				break
			case DEBUFF_ROLE.SUPPORT_MED_FIRE:
				_angle = _directions[6]
				_cw = _cws[6]
				break
			case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
				_angle = _directions[7]
				_cw = _cws[7]
				break
		}
		Obj_camera.character_instances[_i].walk_path = npc_ai(Obj_camera.character_instances[_i].debuff_role, _angle, _cw)
	}
}

function reset() {
	show_debug_message("reset called")
	Obj_camera.state = 0
	Obj_camera.global_time = 0
	Obj_camera.play_speed = 1
	for (var _i = 0; _i < 7; _i++) {
		Obj_camera.character_instances[_i].destroy = true
	}
	for (var _i = 0; _i < 8; _i++) {
		Obj_camera.tower_instances[_i].destroy = true
	}
	Obj_camera.character_instances = []
	Obj_camera.tower_instances = []
	Obj_camera.failures = []
}
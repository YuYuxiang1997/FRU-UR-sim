// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function discrete_failure_check(_time) {
	var _playerx = obj_player.x
	var _playery = obj_player.y
	var _short_fire_roles = [
				DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY, 
				DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY, 
				DEBUFF_ROLE.SUPPORT_SHORT_FIRE
			]
	var _medium_fire_roles = [
				DEBUFF_ROLE.DPS_MED_FIRE,
				DEBUFF_ROLE.SUPPORT_MED_FIRE
			]
	var _long_fire_roles = [
				DEBUFF_ROLE.DPS_LONG_FIRE,
				DEBUFF_ROLE.SUPPORT_LONG_FIRE,
				DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY
			]
	var _rewind_stack_roles = [
		DEBUFF_ROLE.SUPPORT_LONG_FIRE,
		DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY,
		DEBUFF_ROLE.DPS_MED_FIRE,
		DEBUFF_ROLE.DPS_LONG_FIRE,
		DEBUFF_ROLE.DPS_ICE
	]
	var _rewind_spread_roles = [
		DEBUFF_ROLE.SUPPORT_MED_FIRE,
		DEBUFF_ROLE.SUPPORT_SHORT_FIRE,
		DEBUFF_ROLE.SUPPORT_ICE,
		DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY,
		DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY
	]
	switch (_time) {
		//short fire
		case 22:
			//Don't be in another fire
			for (var _i = 0; _i < 7; _i++) {
				if (array_contains(_short_fire_roles,Obj_camera.character_instances[_i].debuff_role)) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Short fire error"
					}
				}
			}
			//Don't hit anyone with fire
			if (array_contains(_short_fire_roles,obj_player.debuff_role)) {
				for (var _i =0; _i<7; _i++) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Short fire error"
					}
				}
			} else {
			//Stack mid
				if (point_distance(_playerx,_playery,room_width/2,room_height/2) > UNHOLY_AOE) {
					return "Did not stack mid"
				}
			}
			break
		//medium fire
		case 32:
			//Don't be in another fire
			for (var _i = 0; _i < 7; _i++) {
				if (array_contains(_medium_fire_roles,Obj_camera.character_instances[_i].debuff_role)) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Medium fire error"
					}
				}
			}
			//Don't hit anyone with fire
			if (array_contains(_medium_fire_roles,obj_player.debuff_role)) {
				for (var _i =0; _i<7; _i++) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Medium fire error"
					}
				}
			} else {
			//Stack mid
				if (point_distance(_playerx,_playery,room_width/2,room_height/2) > UNHOLY_AOE) {
					return "Did not stack mid"
				}
			}
			break
		//long fire
		case 42:
			//Don't be in another fire
			for (var _i = 0; _i < 7; _i++) {
				if (array_contains(_long_fire_roles,Obj_camera.character_instances[_i].debuff_role)) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Medium fire error"
					}
				}
			}
			//Don't hit anyone with fire
			if (array_contains(_long_fire_roles,obj_player.debuff_role)) {
				for (var _i =0; _i<7; _i++) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < FIRE_AOE) {
						return "Medium fire error"
					}
				}
			} else {
			//Stack mid
				if (point_distance(_playerx,_playery,room_width/2,room_height/2) > UNHOLY_AOE) {
					return "Did not stack mid"
				}
			}
			break
		//rewind pos
		case 54:
			//Don't get gazed (too hard i give up)
			//Be in stack
			if (array_contains(_rewind_stack_roles,obj_player.debuff_role)) {
				var _dist = point_distance(room_width/2,room_height/2,obj_player.x,obj_player.y)
				if (_dist > UNHOLY_AOE) {
					return "Not in stack for rewind"
				}
			}
			//Spread
			if (array_contains(_rewind_spread_roles,obj_player.debuff_role)) {
				for (var _i =0; _i<7; _i++) {
					var _dist = point_distance(_playerx,_playery,Obj_camera.character_instances[_i].x, Obj_camera.character_instances[_i].y)
					if (_dist < ERUPTION_AOE) {
						return "Bad spread for rewind"
					}
				}
			}
			break
		//shellcrusher
		case 59:
			//Be middle 
			if (point_distance(_playerx,_playery,room_width/2,room_height/2) > UNHOLY_AOE) {
				return "Did not stack for shell crusher"
			}
			break
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_target_pos(_angle,_distance) {
	return [
		room_width/2 + _distance * cos(_angle),
		room_height/2 + _distance * sin(_angle)
	]
}


function npc_ai(_debuff_role,_angle,_cw){
	var _path = []
	var _t
	//Go middle for debuffs
	array_push(_path,[2,room_width/2,room_height/2])
	//Head towards tower after tethers appear
	_t = get_target_pos(_angle,TOWER_DISTANCE*0.8)
	array_push(_path,[17,_t[0],_t[1]])
	//First fire/stack
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
			_t = get_target_pos(_angle,600)
			array_push(_path,[19,_t[0],_t[1]])
			break
		default:
			array_push(_path,[19,room_width/2,room_height/2])
	}
	//First bait+rewind
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
		case DEBUFF_ROLE.SUPPORT_ICE:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
			_t = get_target_pos(_angle,TOWER_DISTANCE*0.85)
			array_push(_path,[23,_t[0],_t[1]])
			break
		case DEBUFF_ROLE.DPS_MED_FIRE:
			_t = get_target_pos(_angle,20)
			array_push(_path,[23,_t[0],_t[1]])
			break
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
		case DEBUFF_ROLE.DPS_LONG_FIRE:
		case DEBUFF_ROLE.DPS_ICE:
			_t = get_target_pos(_cw ? _angle - 0.1 : _angle + 0.1,TOWER_DISTANCE*1.05)
			array_push(_path,[23,_t[0],_t[1]])
			break
	}
	//Second fire/stack
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
		case DEBUFF_ROLE.DPS_MED_FIRE:
			_t = get_target_pos(_angle,600)
			array_push(_path,[29,_t[0],_t[1]])
			break
		default:
			array_push(_path,[29,room_width/2,room_height/2])		
	}
	//Second bait+rewind
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
			_t = get_target_pos(_angle,TOWER_DISTANCE*0.85)
			array_push(_path,[33,_t[0],_t[1]])
			break			
		case DEBUFF_ROLE.DPS_MED_FIRE:
			array_push(_path,[33,room_width/2,room_height/2])	
			break
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
		case DEBUFF_ROLE.DPS_LONG_FIRE:
		case DEBUFF_ROLE.DPS_ICE:
			_t = get_target_pos(_angle,20)
			array_push(_path,[33,_t[0],_t[1]])
			break
		case DEBUFF_ROLE.SUPPORT_SHORT_FIRE:
		case DEBUFF_ROLE.SUPPORT_ICE:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_LONG_UNHOLY:
		case DEBUFF_ROLE.DPS_SHORT_FIRE_MED_UNHOLY:
			_t = get_target_pos(_cw ? _angle - 0.1 : _angle + 0.1,TOWER_DISTANCE*1.05)
			array_push(_path,[33,_t[0],_t[1]])
			break
	}
	//Third fire/stack
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE:
		case DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY:
		case DEBUFF_ROLE.DPS_LONG_FIRE:
			_t = get_target_pos(_angle,600)
			array_push(_path,[39,_t[0],_t[1]])
			break
		default:
			array_push(_path,[39,room_width/2,room_height/2])		
	}
	//Third bait
	switch (_debuff_role) {
		case DEBUFF_ROLE.SUPPORT_MED_FIRE:
		case DEBUFF_ROLE.DPS_MED_FIRE:
			_t = get_target_pos(_cw ? _angle - 0.1 : _angle + 0.1,TOWER_DISTANCE*1.05)
			array_push(_path,[45,_t[0],_t[1]])
			break
		default:
			array_push(_path,[45,room_width/2,room_height/2])		
	}
	array_push(_path,[56,room_width/2,room_height/2])
	return _path
}
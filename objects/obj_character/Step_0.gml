/// @description Insert description here
// You can write your code in this editor
var _rewind_time = array_contains([
	DEBUFF_ROLE.SUPPORT_LONG_FIRE,
	DEBUFF_ROLE.SUPPORT_LONG_FIRE_UNHOLY,
	DEBUFF_ROLE.DPS_LONG_FIRE,
	DEBUFF_ROLE.DPS_ICE
],debuff_role) ? 37 : 27
if (Obj_camera.global_time > _rewind_time && !rewind_set) {
	rewind_set = true
	rewx = x
	rewy = y
}

if (Obj_camera.global_time > 51 && !rew_to_move_set) {
	rew_to_move_set = true
	rew_to_move = [rewx-x,rewy-y]
}

if (rew_to_move_set && move_dist < 1) {
	x += rew_to_move[0] * Obj_camera.step_time()
	y += rew_to_move[1] * Obj_camera.step_time()
	move_dist += Obj_camera.step_time()
}
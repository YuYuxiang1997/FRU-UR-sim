/// @description Insert description here
// You can write your code in this editor
event_inherited()
if (Obj_camera.global_time == 0) {
	rewind_set = false
	rewx = 0
	rewy = 0

	rew_to_move_set = false
	rew_to_move = [0,0]
	move_dist = 0
}
var lookvec = [
	Obj_camera.x - Obj_camera.lookx,
	Obj_camera.y - Obj_camera.looky
]
Obj_camera.lookx = x
Obj_camera.looky = y
Obj_camera.x = x+lookvec[0]
Obj_camera.y = y+lookvec[1]
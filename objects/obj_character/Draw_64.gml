/// @description Insert description here
// You can write your code in this editor
#macro START_Y 60
#macro Y_DIFF 50


draw_gui(Obj_camera.global_time,100,START_Y+Y_DIFF*character_id,debuff_role)
if (character_id ==0) {
	draw_text(20,START_Y, "You")
} else {
	draw_text(20,START_Y+Y_DIFF*character_id,string_concat("Player ",character_id))
}
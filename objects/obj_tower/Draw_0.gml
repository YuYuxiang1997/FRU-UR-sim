/// @description Insert description here
// You can write your code in this editor

#macro LASER_DIST 1000
#macro LASER_WIDTH 10

if (Obj_camera.global_time > 11) {
	draw_sprite(sprite_index,-1,x-50,y-50)
}

//Draw tethers
if (Obj_camera.global_time > 16 && Obj_camera.global_time < 21) {
	if (order == 0) {
		draw_set_color(c_yellow)
		draw_line_width(x,y,room_width/2,room_height/2,5)
		draw_set_color(c_white)
	}
	if (order == 2) {
		draw_set_color(c_purple)
		draw_line_width(x,y,room_width/2,room_height/2,5)
		draw_set_color(c_white)
	}
}

function draw_line_with_angle(_x,_y,_angle) {
	draw_line_width(_x,_y,_x+LASER_DIST*cos(_angle),_y+LASER_DIST*sin(_angle),LASER_WIDTH)
}

switch (order) {
	case 0:
		if (Obj_camera.global_time > 23 && Obj_camera.global_time < 27) {
			draw_sprite(clockwise ? spr_cw : spr_ccw,-1,x-75,y-75)
		}
		draw_set_alpha(0.5)
		if (Obj_camera.global_time > 27 && Obj_camera.global_time < 27+DEBUFF_LINGER) {
			draw_line_with_angle(x,y,shot_angle)
		}
		if (Obj_camera.global_time > 30 && Obj_camera.global_time < 39) {
			draw_line_with_angle(x,y,shot_angle)
		}
		draw_set_alpha(1)
		break
	case 1:
		if (Obj_camera.global_time > 33 && Obj_camera.global_time < 37) {
			draw_sprite(clockwise ? spr_cw : spr_ccw,-1,x-75,y-75)
		}
		draw_set_alpha(0.5)
		if (Obj_camera.global_time > 37 && Obj_camera.global_time < 37+DEBUFF_LINGER) {
			draw_line_with_angle(x,y,shot_angle)
		}
		if (Obj_camera.global_time > 40 && Obj_camera.global_time < 49) {
			draw_line_with_angle(x,y,shot_angle)
		}
		draw_set_alpha(1)
		break
	case 2:
		if (Obj_camera.global_time > 45 && Obj_camera.global_time < 49) {
			draw_sprite(clockwise ? spr_cw : spr_ccw,-1,x-75,y-75)
		}
		draw_set_alpha(0.5)
		if (Obj_camera.global_time > 49 && Obj_camera.global_time < 49+DEBUFF_LINGER) {
			draw_line_with_angle(x,y,shot_angle)
		}
		if (Obj_camera.global_time > 52 && Obj_camera.global_time < 61) {
			draw_line_with_angle(x,y,shot_angle)
		}
		draw_set_alpha(1)
		break
}
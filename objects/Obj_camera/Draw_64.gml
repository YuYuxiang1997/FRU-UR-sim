/// @description Insert description here
// You can write your code in this editor
draw_text(20,20,global_time)
draw_text(100,20,string_concat("Role: ",role))


if (global_time > 1 && global_time <11) {
	draw_rectangle(300,40,700,60,true)
	draw_rectangle(300,40,300+400*(global_time/10-0.1),60,false)
	draw_text(400,20,"Ultimate relativity")
}

if (global_time > 54 && global_time < 59) {
	draw_rectangle(300,40,700,60,true)
	draw_rectangle(300,40,300+400*(global_time/5-10.8),60,false)
	draw_text(400,20,"Shellcrusher")
}

if (global_time > 49 && global_time < 51) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(room_width/2,room_height/4, "Look outwards")
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}


//UI elements
draw_text(30,730, "Z = slow down, X = speed up, C = change role, Space = pause/play, R = reset")

//Draw failures
draw_set_color(c_red)
draw_set_halign(fa_right)
for (var _i = 0; _i < array_length(failures); _i++) {
	draw_text(1300,30+_i*30,failures[_i])
}
draw_set_color(c_white)
draw_set_halign(fa_left)
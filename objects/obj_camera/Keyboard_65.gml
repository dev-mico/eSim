/// @description Insert description here
// You can write your code in this editor

following = pointer_null;

var value_to_add = camera_get_view_width(cam_id) / 100;
if (shiftDown == true) {
	value_to_add*=3;	
}

x -=  value_to_add;

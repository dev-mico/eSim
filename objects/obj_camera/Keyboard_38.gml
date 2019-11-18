/// @description Insert description here
// You can write your code in this editor

var value_to_add = camera_get_view_height(cam_id) / 100;
if (shiftDown == true) {
	value_to_add*=3;	
}
y -= value_to_add;

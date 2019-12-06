/// @description Insert description here
// You can write your code in this editor

following = pointer_null;
target = obj_camera;
orig_x_size  = room_width;
orig_y_size = room_height;
zoom = 1;
target_zoom = 1;
minimum_zoom = 25 * (1500/room_width);
cam_id = view_camera[0];
shiftDown = false; // variable to check if shift is down. if it is, the camera will move at 2x speed.
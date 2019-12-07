/// @description Draw the GUI layer partly transparently. In the "begin" event so that it draws before (under) other GUI elements.
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;

draw_sprite_ext(bottomGUILayer, 0, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 0.6);
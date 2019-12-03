//@description Draw the GUI depending on whether the game is paused and whether its selected.
var GUIscaleX = camera_get_view_width(view_camera[0])/1500;
var GUIscaleY = camera_get_view_width(view_camera[0])/1500;

var localScaleX = scaleX * GUIscaleX;
var localScaleY = scaleY * GUIscaleY;

draw_sprite_ext(sprite, -1, x*localScaleX, y*localScaleY, buttonscaleX*GUIscaleX, buttonscaleY*GUIscaleY, 0, c_white, 0.5); //Draw the background boxx


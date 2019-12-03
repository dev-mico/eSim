//@description Draw the GUI depending on whether the game is paused and whether its selected.
var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;


draw_sprite_ext(textBoxSprite, 0, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 0.75);

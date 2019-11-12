/// @description Draw the button depending on the time dilation factor.
var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;

draw_sprite_ext(timeDilationSprite, sprite, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
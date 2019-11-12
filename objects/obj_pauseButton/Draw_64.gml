//@description Draw the GUI depending on whether the game is paused and whether its selected.
var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;


if hovered == true or highlighted == true {
	if (global.paused == true) {
		draw_sprite_ext(pauseButtonSprite, 3, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
	} else {
		draw_sprite_ext(pauseButtonSprite, 2, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
	}
} else {
	if (global.paused == true) {
		draw_sprite_ext(pauseButtonSprite, 1, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
	} else {
		draw_sprite_ext(pauseButtonSprite, 0, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
	}
}
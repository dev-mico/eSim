/// @description Track whether pause button is hovered or clicked, and whether "p" is pressed.

var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_height(view_camera[0])/1500;

var viewPortLeftX = inst_PLAYERCAMERA.x - (camera_get_view_width(view_camera[0])/2);
var viewPortTopY = inst_PLAYERCAMERA.y - (camera_get_view_height(view_camera[0])/2);

var leftBorderX = viewPortLeftX + (x*scaleX);
var rightBorderX = x2*scaleX + viewPortLeftX;
var topBorderY = y*scaleY + viewPortTopY;
var bottomBorderY = y2*scaleY + viewPortTopY;

if (point_in_rectangle(mouse_x, mouse_y, leftBorderX, topBorderY, rightBorderX, bottomBorderY) == true) {
	hovered = true;
} else {
	hovered = false;
}

if (mouse_check_button_pressed(mb_left) == true) { //Mouse click check
	if (hovered == true) {
		playSound(1);
		if (global.paused == false) {
			global.paused = true;
		} else {
			global.paused = false;
		}
	}
}

if (keyboard_check_pressed(80) == true) or (keyboard_check_pressed(32) == true) {
	highlighted = true;
	playSound(1);
	if (global.paused == false) {
			global.paused = true;
		} else {
			global.paused = false;
	}
	alarm[0] = 5; //de-highlight the button after 5 steps
}
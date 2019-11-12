/// @description Track whether pause button is hovered or clicked, and whether "p" is pressed.

var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;

X1 = x1 * scaleX;
X2 = x2 * scaleX;
Y2 = y2 * scaleY;

if (point_in_rectangle(mouse_x, mouse_y, X1, y*scaleY, X2, Y2) == true) {
	hovered = true;
} else {
	hovered = false;	
}

if (mouse_check_button_pressed(mb_left) == true) { //Mouse click check
	if (hovered == true) {
		playSound(1);
		room_goto(TitleScreen);
	}
}

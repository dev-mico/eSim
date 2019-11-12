//@description Draw the button differently depending on whether or not the button is hovered by the mouse.
//@author Marcos Lacouture

var scaleX = camera_get_view_width(view_camera[0])/1500;
var scaleY = camera_get_view_width(view_camera[0])/1500;

draw_set_font(fontMainMenuSubheader); //Set the font
draw_set_halign(fa_center); //Centers text drawing


if hovered == true { //Draw the text as red if the button is being hovered by the mouse.
	draw_set_color(c_red);
	draw_sprite_ext(exitButtonSprite, 0, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
} else {
	draw_set_color(c_white);
	draw_sprite_ext(exitButtonSprite, 0, x*scaleX, y*scaleY, scaleX, scaleY, 0, c_white, 1);
}


draw_text_transformed(x*scaleX, (y+13)*scaleY, "Exit", scaleX, scaleY, 0);
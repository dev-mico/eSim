// @author Marcos Lacouture
/// @description Draw the buttons to the screen
// You can write your code in this editor



draw_set_font(fontMainMenuHeader); //Sets the 'draw' font to the main menu font
draw_set_halign(fa_center); //Centers text rather than aligning it to the center
draw_set_color(c_green);
draw_text(menu_x, menu_y, "eSim");

draw_set_font(fontMainMenuSubheader);
draw_text(menu_x, menu_y + 150, "The evolution simulator designed to illustrate AI");

draw_set_font(fontMainMenuSubSubheader);
draw_text(menu_x, menu_y + (button_h/2 + 150), "Developed by Marcos Lacouture, Teddy Arrasavelli and Jonathan Lai");

draw_set_font(fontMainMenu);
for (var i = 0; i < buttonCount; i++) {
	
	if (i == lastSelected) {
		draw_set_color(c_red);
	} else {
		draw_set_color(c_white);
	}
	
	draw_text(menu_x, (menu_y + 300 + (button_h * 2) + (button_h * i)), button[i]); //Draw text with the menu's x, and the menu's Y (incrementing by the button_h), and print the text of each button
}
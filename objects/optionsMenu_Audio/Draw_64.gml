// @author Marcos Lacouture
/// @description Draw the buttons and sliders to the screen.
// You can write your code in this editor

draw_set_font(fontMainMenuHeader); //Sets the 'draw' font to the main menu font
draw_set_halign(fa_center); //Centers text rather than aligning it to the center
draw_set_color(c_green);
draw_text(menu_x, menu_y, "eSim");

draw_set_font(fontMainMenuSubheader);
draw_text(menu_x, menu_y + 150, "The evolution simulator designed to illustrate AI");

draw_set_font(fontMainMenuSubSubheader);
draw_text(menu_x, menu_y + 182, "Developed by Marcos Lacouture, Teddy Arrasavelli and Bret Craig");

draw_set_font(fontMainMenu);

sliderCount = 0; //The amount of sliders


for (var i = 0; i < buttonCount; i++) {	
	Y_Offset = topOffset + ((sprite_get_height(0) + button_h) * sliderCount) + (button_h * 2) + (button_h * i); //Calculate the Y offset based on several different things
	
	if (i == lastSelected) { //If you are drawing the active button, make the text red
		draw_set_color(c_red);
	} else {
		draw_set_color(c_white);
	}
	
	if (string_count("Slider:", button[i]) > 0) { //If the button contains "Slider:", draw a slider rather than a button
		text = string_delete(button[i], 1, 7); //Remove "Slider:" from the text. THIS METHOD IS NOT 0-BASED INDEX
		draw_text(menu_x, (menu_y + Y_Offset), text); //Draw the text after Slider: above the slider
		sliderCount += 1;
		
		if (button[i] == "Slider:Music Volume") { //Draw the music slider, based on volume
			var volume = inst_MUSICLOOPER.musicVolume;
			draw_sprite(VolumeSliderBase, volume/10, menu_x, (menu_y + Y_Offset + (sprite_get_height(0) + button_h))); // Add the the slider's height with the buffer to account for the new slider, and draw the slider.
		} else if (button[i] = "Slider:Sound Effects Volume") {
			var volume = inst_SFXPLAYER.SFXVolume;
			draw_sprite(VolumeSliderBase, volume/10, menu_x, (menu_y + Y_Offset + (sprite_get_height(0) + button_h)));
		}
	} else { //If the button is not a slider, draw a regular button
		draw_text(menu_x, (menu_y + Y_Offset), button[i]); //Draw text with the menu's x, and the menu's Y (incrementing by the button_h), and print the text of each button
	}
}
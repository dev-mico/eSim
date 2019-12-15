// @author Marcos Lacouture
/// @description Draw the buttons and sliders to the screen.
// You can write your code in this editor

draw_set_font(fontMainMenuHeader); //Sets the 'draw' font to the main menu font
draw_set_halign(fa_center); //Centers text rather than aligning it to the center
draw_set_color(c_green);
draw_text_transformed(menu_x, menu_y, "eSim", 0.8, 0.8, 0);

draw_set_font(fontMainMenuSubheader);
draw_text(menu_x, menu_y + 120, "The evolution simulator designed to illustrate AI");

draw_set_font(fontMainMenuSubSubheader);
draw_text(menu_x, menu_y + 152, "Developed by Marcos Lacouture, Teddy Arrasavelli and Bret Craig");

draw_set_font(fontMainMenu);

sliderCount = 0; //The amount of sliders

scrollerPosition = -1; //THis variable is necessary so that you only scoot the menu elements below the scroller down.
	scrollerHeight = sprite_get_height(1);

for (var i = 0; i < buttonCount; i++) {	
	Y_Offset = topOffset + ((sprite_get_height(0) + button_h) * sliderCount) + (button_h * 2) + (button_h * i); //Calculate the Y offset based on several different things
	
	if (scrollerPosition != -1 && scrollerOpen = true && i > scrollerPosition) { //If the scroller is open and the button being rendered is below the scroller
		Y_Offset += scrollerHeight + button_h;
	}
	
	if (i == lastSelected) { //If you are drawing the active button, make the text red
		draw_set_color(c_red);
	} else {
		draw_set_color(c_white);
	}
	
	if (string_count("Slider:", button[i]) > 0) { //If the button contains "Slider:", draw a slider rather than a button
		text = string_delete(button[i], 1, 7); //Remove "Slider:" from the text. THIS METHOD IS NOT 0-BASED INDEX
		draw_text(menu_x, (menu_y + Y_Offset), text); //Draw the text after Slider: above the slider
		sliderCount += 1;
		
		if (button[i] == "Slider:Species Density Limit") { //Draw the species amount slider
			draw_sprite(VolumeSliderBase, global.speciesLimit - 1, menu_x, (menu_y + Y_Offset + (sprite_get_height(0) + button_h))); // Add the the slider's height with the buffer to account for the new slider, and draw the slider.
		} 
	} else if (string_count("Scroller:", button[i]) > 0) { //If the button is a "scroller" menu
			text = string_delete(button[i], 1, 9); //Remove "Scroller:" from the text. THIS METHOD IS NOT 0-BASED INDEX
			scrollerPosition = i;
			draw_text(menu_x, (menu_y + Y_Offset), text); //Draw text after "Scroller:" above the scroller menu
			
			if (scrollerOpen == true) { //If the scroller is open, draw the scroller
				draw_set_font(fontOptions);
				draw_sprite(1, scrollerSubimage, menu_x, (menu_y + Y_Offset + (scrollerHeight/2) + button_h));
				draw_set_color(c_white);
				draw_text_transformed(menu_x, (menu_y + Y_Offset + (scrollerHeight/1.5) + button_h), diets[currentDietIndex], 0.5, 0.5, 0); //Center and scale text adequately.
				draw_set_font(fontMainMenu);			
			}
			
		} else { //If the button is not a slider, draw a regular button
			draw_text(menu_x, (menu_y + Y_Offset), button[i]); //Draw text with the menu's x, and the menu's Y (incrementing by the button_h), and print the text of each button
	}
}
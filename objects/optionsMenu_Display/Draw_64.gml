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

if (activeMenu == "Display") {
	for (var i = 0; i < buttonCount; i++) {	
		Y_Offset = topOffset + (button_h * 2) + (button_h * i); //Calculate the Y offset based on several different things
	
		if (i == lastSelected) { //If you are drawing the active button, make the text red
			draw_set_color(c_red);
		} else {
			draw_set_color(c_white);
		}
	

		draw_text(menu_x, (menu_y + Y_Offset), button[i]); //Draw text with the menu's x, and the menu's Y (incrementing by the button_h), and print the text of each button
	
	}
} else if (activeMenu == "Resolution") { //NOTE: THIS CODE ASSUMES THERE IS ONLY ONE SCROLLING MENU IN THE RESOLUTION MENU.
	scrollerPosition = -1; //THis variable is necessary so that you only scoot the menu elements below the scroller down.
	scrollerHeight = sprite_get_height(1);
	
	for (var i = 0; i < array_length_1d(resolutionButtons); i++) {	
		Y_Offset = topOffset + (button_h * 2) + (button_h * i); //Calculate the Y offset based on several different things
		
		if (scrollerPosition != -1 && scrollerOpen = true && i > scrollerPosition) { //If the scroller is open and the button being rendered is below the scroller
			Y_Offset += scrollerHeight + button_h;
		}
		
		if (i == lastSelected) { //If you are drawing the active button, make the text red
			draw_set_color(c_red);
		} else {
			draw_set_color(c_white);
		}
	
		
		if (string_count("Scroller:", resolutionButtons[i]) > 0) { //If the button is a "scroller" menu
			text = string_delete(resolutionButtons[i], 1, 9); //Remove "Scroller:" from the text. THIS METHOD IS NOT 0-BASED INDEX
			scrollerPosition = i;
			draw_text(menu_x, (menu_y + Y_Offset), text); //Draw text after "Scroller:" above the scroller menu
			
			if (scrollerOpen == true) { //If the scroller is open, draw the scroller
				draw_set_font(fontOptions);
				draw_sprite(1, scrollerSubimage, menu_x, (menu_y + Y_Offset + (scrollerHeight/2) + button_h));
				draw_set_color(c_white);
				draw_text_transformed(menu_x, (menu_y + Y_Offset + (scrollerHeight/1.5) + button_h), resolutions[currentResIndex], 0.5, 0.5, 0); //Center and scale text adequately.
				draw_set_font(fontMainMenu);			
			}
			
		} else { //If the button is not a scroller menu, draw a regular button
			draw_text(menu_x, (menu_y + Y_Offset), resolutionButtons[i]); 
		}	
	}
} else if (activeMenu == "Window") {
	scrollerPosition = -1; //THis variable is necessary so that you only scoot the menu elements below the scroller down.
	scrollerHeight = sprite_get_height(1);
	
	for (var i = 0; i < array_length_1d(windowButtons); i++) {	
		Y_Offset = topOffset + (button_h * 2) + (button_h * i); //Calculate the Y offset based on several different things
		
		if (scrollerPosition != -1 && scrollerOpen = true && i > scrollerPosition) { //If the scroller is open and the button being rendered is below the scroller
			Y_Offset += scrollerHeight + button_h;
		}
		
		if (i == lastSelected) { //If you are drawing the active button, make the text red
			draw_set_color(c_red);
		} else {
			draw_set_color(c_white);
		}
	
		
		if (string_count("Scroller:", windowButtons[i]) > 0) { //If the button is a "scroller" menu
			text = string_delete(windowButtons[i], 1, 9); //Remove "Scroller:" from the text. THIS METHOD IS NOT 0-BASED INDEX
			scrollerPosition = i;
			draw_text(menu_x, (menu_y + Y_Offset), text); //Draw text after "Scroller:" above the scroller menu
			
			if (scrollerOpen == true) { //If the scroller is open, draw the scroller
				var fullscreen2 = fullscreen;
				
				if (fullscreen2 == true) { // This code is needed to display True or False rather than 1 or 0.
					fullscreen2 = "True";
				} else {
					fullscreen2 = "False";	
				}
				
				draw_set_font(fontOptions);
				draw_sprite(1, scrollerSubimage, menu_x, (menu_y + Y_Offset + (scrollerHeight/2) + button_h));
				draw_set_color(c_white);
				draw_text_transformed(menu_x, (menu_y + Y_Offset + (scrollerHeight/1.5) + button_h), fullscreen2, 0.5, 0.5, 0); //Center and scale text adequately.
				draw_set_font(fontMainMenu);			
			}
			
		} else { //If the button is not a scroller menu, draw a regular button
			draw_text(menu_x, (menu_y + Y_Offset), windowButtons[i]); 
		}	
	}
}
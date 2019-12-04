// Author: Marcos
/// @description Checks for keyboard input and updates which button is selected accordingly.

// GML Note: "step" events are events checked with every 'step' of the game.

menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up); //Returns 0 if nothing is being pressed (or both are pressed), 1 if vk_down is pressed, -1 if vk up is pressed

//Code for moving between butons below

menuIndex += menu_move;

if (menuIndex != lastSelected) { //If the button was moved
	playSound(1);
}

if (menuIndex < 0) {
	menuIndex = buttonCount - 1; //If it goes out of the array in the negative direction, put it at the end.
} else if (menuIndex == buttonCount) {
	menuIndex = 0; //If it goes out of the array in the positive direction, move it to the top
}

lastSelected = menuIndex;

//Code for shifting slider below
var slider_move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left); //If right is pressed returns 1. If left is pressed, return -1. Otherwise, return 0. 

if (button[lastSelected] == "Slider:Food Scarcity") { //If currently on the slider, execute the slider's function. The slider's visual will automatically adjust.
	
	if (slider_move != 0) { //If the slider was moved
		playSound(1);
		if (slider_move == 1) and (global.foodScarcity < 11) {
			global.foodScarcity++;
		} else if (slider_move == -1) and (global.foodScarcity > 1) {
			global.foodScarcity--;
		}
	}
	
} else if (button[lastSelected] == "Slider:World Size") { //If currently on the slider, execute the slider's function. The slider's visual will automatically adjust.

	
	if (slider_move != 0) { //If the slider was moved
		playSound(1);
		if (slider_move == 1) and (global.worldSize < 5500) {
			global.worldSize += 500;
		} else if (slider_move == -1) and (global.worldSize > 500) {
			global.worldSize -= 500;
		}
	}
} else if (button[lastSelected] == "Slider:Species Density Limit") {
	if (slider_move != 0) {
		scrollerSubimage = 2;
		playSound(1);
		global.speciesLimit += slider_move;
		if (global.speciesLimit < 1) {
			global.speciesLimit = 1;	
		} else if (global.speciesLimit > 11) {
			global.speciesLimit = 11;	
		}
		alarm[0] = 5;
	}
}
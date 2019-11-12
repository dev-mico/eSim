// Author: Marcos
/// @description Checks for keyboard input and updates which button is selected accordingly.

// GML Note: "step" events are events checked with every 'step' of the game.

menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up); //Returns 0 if nothing is being pressed (or both are pressed), 1 if vk_down is pressed, -1 if vk up is pressed

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

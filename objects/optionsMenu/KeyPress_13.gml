playSound(1);
if (button[menuIndex] == "Return to Menu") {
	room_goto(titleMenu);
} else if (button[menuIndex] == "Audio Options") {
	room_goto(OptionsScreen_Audio);
} else if (button[menuIndex] == "Display Options") {
	room_goto(OptionsScreen_Display);	
} else if (button[menuIndex] == "Simulation Options") {
	room_goto(OptionsScreen_Simulation);	
}
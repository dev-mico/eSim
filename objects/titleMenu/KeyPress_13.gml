playSound(1);
if (button[menuIndex] == "Exit") {
	game_end();
} else if (button[menuIndex] == "Options") {
	room_goto(OptionsScreen);	
} else if (button[menuIndex] == "New Simulation") {
	runSimulation();
}

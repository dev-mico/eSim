if (button[menuIndex] == "Return to Options") {
	playSound(1);
	room_goto(OptionsScreen);
}  else if (button[menuIndex] == "Scroller:Initial Diet") {
	playSound(1);
	if (scrollerOpen == true) {
		scrollerOpen = false;
		if (diets[currentDietIndex] == "Herbivore") {
			global.initialDiet = 1;
		} else if (diets[currentDietIndex] == "Carnivore") {
			global.initialDiet = -1;
		} else if (diets[currentDietIndex] == "Omnivore") {
			global.initialDiet = 0;
		} else if (diets[currentDietIndex] == "Random Diet") {
			global.initialDiet = 2;
		}
		show_debug_message(global.initialDiet);
	} else {
		scrollerOpen = true;	
	}
}
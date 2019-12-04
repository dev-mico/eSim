/// @description When right key is pressed, change sprites


if (scrollerOpen == true) and (button[menuIndex] == "Scroller:Initial Diet") {
	scrollerSubimage = 1;
	playSound(1);
	if (currentDietIndex == array_length_1d(diets) - 1) {
		currentDietIndex = 0;
	} else {
		currentDietIndex += 1;	
	}
	alarm[0] = 5;
	
}
/// @description When left key is pressed, change the sprite



if (scrollerOpen == true) and (button[menuIndex] == "Scroller:Initial Diet"){
	scrollerSubimage = 2;
	playSound(1);
	if (currentDietIndex == 0) {
		currentDietIndex = array_length_1d(diets) - 1;
	} else {
		currentDietIndex -= 1;	
	}
	alarm[0] = 5;
}

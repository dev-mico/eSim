/// @description When left key is pressed, change the sprite


if (activeMenu == "Resolution" or activeMenu == "Window") {
	if (scrollerOpen == true) {
		scrollerSubimage = 2;
		playSound(1);
		if (activeMenu == "Resolution") {
			if (currentResIndex == 0) {
				currentResIndex = array_length_1d(resolutions) - 1;
			} else {
				currentResIndex -= 1;	
			}
		} else {
			if (fullscreen == true) {
				fullscreen = false;
			} else {
				fullscreen = true;	
			}
		}
		alarm[0] = 5;
	}
}
/// @description When right key is pressed, change sprites

if (scrollerOpen == true) {
	
}
if (activeMenu == "Resolution" or activeMenu == "Window") {
	if (scrollerOpen == true) {
		scrollerSubimage = 2;
		playSound(1);
		if (activeMenu == "Resolution") {
			if (currentResIndex == array_length_1d(resolutions) - 1) {
				currentResIndex = 0;
			} else {
				currentResIndex += 1;	
			}
			alarm[0] = 5;
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
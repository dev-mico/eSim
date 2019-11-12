playSound(1);
if (activeMenu == "Display") {
	if (button[menuIndex] == "Return to Options") {
		buttonCount = array_length_1d(button);
		room_goto(OptionsScreen);
	}  else if (button[menuIndex] == "Resolution Options") {
		buttonCount = array_length_1d(resolutionButtons);
		activeMenu = "Resolution";
		lastSelected = 0;
		menuIndex = 0;
	} else if (button[menuIndex] == "Window Options") {
		buttonCount = array_length_1d(windowButtons);
		activeMenu = "Window";
		lastSelected = 0;
		menuIndex = 0;
	}
} else if (activeMenu == "Resolution") {
	if (resolutionButtons[menuIndex] == "Return to Display Options") {
		activeMenu = "Display";	
	} else if (resolutionButtons[menuIndex] == "Auto-detect") {
		window_set_size(display_get_width(), display_get_height());
		alarm[1] = 1;
	} else if (resolutionButtons[menuIndex] == "Scroller:Set Manually") {
		if (scrollerOpen == false) { //Open or close the scroller
			scrollerOpen = true;
		} else {
			scrollerOpen = false;	
			
			var tempString = "";
			var foundX = false;
			var index = 1; //Must start at 1, as the string_char_at() method/script is not zero-based index.
			
			while (foundX == false) { //This loop will go through and parse the X value out of a string with the format #1X#2 into the first number and the second number
				if (string_char_at(resolutions[currentResIndex], index) != "X") {
					tempString += (string_char_at(resolutions[currentResIndex], index));
					index++;
				} else {
					foundX = true;
				}
			}
			
			var newX = real(tempString); //turn to a integer
			tempString = ""
			
			
			for (var i = index; i < string_length(resolutions[currentResIndex]); i++) { //This loop will parse the Y value out of the string
				tempString += string_char_at(resolutions[currentResIndex], (i + 1)); 
			}
			
			var newY = real(tempString);
					
			window_set_size(newX, newY);
			alarm[1] = 1;
		}
	} 
} else if (activeMenu == "Window") {
		if (windowButtons[menuIndex] == "Return to Display Options") {
			activeMenu = "Display";	
			buttonCount = array_length_1d(button);
		} else if (windowButtons[menuIndex] == "Scroller:Fullscreen") {
			if (scrollerOpen == false) {
				scrollerOpen = true;
			} else {
				scrollerOpen = false;
				if (fullscreen == true) {
					window_set_fullscreen(1);
				} else {
					window_set_fullscreen(0);	
				}
			}
		}
}
/// @description Change the drawing

yAdjust = 0;//camera_get_view_y(view_camera[0]) - prevViewportY;
xAdjust = 0; //origViewportX - camera_get_view_x(view_camera[0]);
prevViewportY = camera_get_view_y(view_camera[0]);



if (initialized == true) {
	if (fadeInSteps == -1) { //Start the count
		fadeInSteps = origFadeInSteps;
		fadeOutSteps = 1;
		holdSteps = origHoldSteps;
	} else if (fadeInSteps > 0) {
		currentY = y + ((fadeInSteps/origFadeInSteps) *(yRange/2)) + yAdjust; //This is the math to get the Y-coordinate based on your step.
		alpha = origFadeInSteps/fadeInSteps;
		fadeInSteps -= 1;
	} else if (holdSteps > 0) {
		alpha = 1;
		holdSteps -= 1;	
	} else if (fadeOutSteps < origFadeOutSteps) {
		currentY = y - ((fadeOutSteps/origFadeOutSteps) * (yRange/2))  + yAdjust; //Again, this is math that I did to draw it.
		alpha -= 1/origFadeOutSteps;
		fadeOutSteps++;
	} else {
		instance_destroy(id);	
	}
}
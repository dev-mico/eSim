/// @description Count down to regrowth, then regrow the food on the bush.
// @author Marcos Lacouture

if (currentFood == 0) {
	regrowing = true;
	regrowthCountdown = regrowthTime;
	currentFood = -1; //Change to placeholder value of negative one so you don't constantly restart the countdown	
} else if (regrowing == true) {
	if (global.paused == false) {
		regrowthCountdown -= global.timeScale; // Reduce the countdown
		if (regrowthCountdown < 0) {
			currentFood = maxFood;
			regrowing = false;
		}
	}
}
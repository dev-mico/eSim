/// @description Instantiate a new bush.

randomize();
foodTypeRandom = round(random(100)); 

regrowthTime = 12500; //Amount of time it takes, in game steps (scaled for timeScale), for the bush to regrow its food.

foodType = -1;
maxFood = 0; //The amount of hunger the food on this bush restores
currentFood = 0 ;

if (foodTypeRandom >= 0 and foodTypeRandom < 30) { //30% chance for foodType 0
	foodType = 0;	
	maxFood = 50;
} else if (foodTypeRandom >= 30 and foodTypeRandom < 50) { //20% chance for foodType 1
	foodType = 1;	
	maxFood = 75;
} else if (foodTypeRandom >= 50 and foodTypeRandom < 70) { //20% chance for foodType 2
	foodType = 2;	
	maxFood = 125;
} else if (foodTypeRandom >= 70 and foodTypeRandom < 83) { //13% chance for foodType 3
	foodType = 3;	
	maxFood = 175;
} else if (foodTypeRandom >= 80 and foodTypeRandom < 92) { //12% chance for foodType 4
	foodType = 4;	
	maxFood = 225;
} else { //8% chance for foodType 5
	foodType = 5;
	maxFood = 500;
}

currentFood = maxFood;

image_speed = 0;
image_index = foodType + 1;

regrowthCountdown = regrowthTime; //These two are variables that will be checked during step events to count down to regrowth of food.
regrowing = false; //This is done in a step event rather than an alarm because an alarm cannot take in account the timeScale (if the timeScale changes while it is counting down)
//@description findFood will find the nearest source of food for herbivores and return the object is finds.
// The food will only be found if its within the creature's range of perception. If no food is found, return a null pointer.
//@author Marcos Lacouture

//Precondition: findFood script is called, with the parameters creature (a reference to a creature object) and perception (a float).
//Postcondition: The nearest instance of herbivorous food (the nearest food bush) within the creature's range of perception will be returned.
// If the creature does not perceieve any food within its range, return null.

var creature = argument[0];
var sightRange = argument[1];

var viewXLeft = creature.x - sightRange;
var viewXRight = creature.x + sightRange;
var viewYTop = creature.y - sightRange;
var viewYBottom = creature.y + sightRange;


if (viewXLeft < creature.creatureWidth/8) {
	viewXLeft = creature.creatureWidth/8;	
}
if (viewXRight > (room_width - (creature.creatureWidth/8))) {
	viewXRight = room_width - (creature.creatureWidth/8);
}
if (viewYTop < creature.creatureHeight/8) {
	viewYTop = creature.creatureHeight/8;	
}
if (viewYBottom > room_height - (creature.creatureHeight/8)) {
	viewYBottom = room_height - (creature.creatureHeight/8);	
}


var checkX = viewXLeft; //Start checking at the top left point of the creature's view range.
var checkY = viewYTop;
var foundFood = false; //This will be set true if a food bush is within the creature's view

foodFound = pointer_null; //this will be returned at the end. If food is found, then this will be a pointer to the foodBush object that was found.

var searchingX = true;
while (searchingX == true) { //Check every X position
	var searchingY = true;
	while (searchingY == true) { //Check every Y position at each individual X position, like a grid
		if (position_meeting(checkX, checkY, foodBush) == true) { //If you find a food bush
			foodFound = instance_position(checkX, checkY, foodBush);
			
			if ((foodFound.x <  (room_width - (creature.creatureWidth/8)) and foodFound.x > (creature.creatureWidth/8))) {
				if ((foodFound.y < room_height - (creature.creatureHeight/8)) and (foodFound.y > creature.creatureHeight/8)) {
					if (foodFound.currentFood > 0) { //If the food bush has food in it.
						foundFood = true;
						searchingX = false;
						searchingY = false; //Stop searching for food
					} else {
						foodFound = pointer_null;	
					}
				} else {
					foodFound = pointer_null;	
				}
			} else {
				foodFound = pointer_null;	
			}
		} else if (checkY + 1 > viewYBottom) { //If you have checked every Y position at the given X, stop checking the Ys. 
			searchingY = false;
		} 
		checkY += 1;//If you didn't find any food and you are still searching for Y, this will move the Y position further down to check again.
	}
	
	
	if (checkX + 1 > viewXRight) { //If you would check outside the creature's view range, then you haven't found any food bushes. Stop searching.
		searchingX = false;
	} else {
		checkX += 1; //If you didn't find any bushes at all the Y-coordinates and the current (checkX) coordinate, move the x coordinate down further and re-check every Y coordinate..
	}
}

if (foundFood == true) { //If you found a food bush, return the bush's ID.
	return foodFound;
} else { //Otherwise, return a null pointer.
	return pointer_null;
}
//@description findFood will find the nearest source of food for herbivores and return the object is finds.
// The food will only be found if its within the creature's range of perception. If no food is found, return a null pointer.
//@author Marcos Lacouture

//Precondition: findFood script is called, with the parameters creature (a reference to a creature object) and perception (a float).
//Postcondition: The nearest instance of herbivorous food (the nearest food bush) within the creature's range of perception will be returned.
// If the creature does not perceieve any food within its range, return null.

var creature = argument[0];
var sightRange = argument[1];

closestFoodBush = pointer_null; //The closest food bush will be here
closestDistance = 99999999999; //Set this to a high value to avoid unnecessary fringe cases. Slight performance improvement

for (var i = 0; i < ds_list_size(global.foodBushList); i++) { //Check every foodBush, and find the closest one (within the creature's view).
	var foodFound = ds_list_find_value(global.foodBushList, i);
	var distanceFromFood = sqrt(sqr(creature.x - foodFound.x) + sqr(creature.y - foodFound.y));
	
	if (distanceFromFood <= sightRange) and (distanceFromFood < closestDistance) {
			if ((foodFound.x <  (room_width - (creature.creatureWidth/8) - 1) and (foodFound.x > 1 + (creature.creatureWidth/8)))) {
				if ((foodFound.y < room_height - (creature.creatureHeight/8) - 1) and (foodFound.y > (creature.creatureHeight/8) + 1)) {
					if (foodFound.currentFood > 0) { //If the food bush has food in it.
						closestFoodBush = foodFound;
						closestDistance = distanceFromFood;
					}
				}
			}
	}
}

return closestFoodBush;

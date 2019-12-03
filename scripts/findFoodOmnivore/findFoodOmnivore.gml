//Precondition: findFoodOmnivore script is called, with the parameters creature (a reference to a creature object) and sightRange.
//Postcondition: Return the food found for the omnivore. Omnivores will only inherit carnivorous behavior at a certain level of hunger, and always go for herbivorous food before carnivorous food.

var creature = argument[0];
var sightRange = argument[1];

var foodFound= findFood(creature, sightRange);

if (foodFound == pointer_null) {
	if (creature.hunger < (creature.maxHunger * 0.4)) { //Omnivorous creatures will only consider hunting or eating corpses at the 40% hunger threshold.
		foodFound = findFoodCarnivore(creature, sightRange);
	}
}

return foodFound;
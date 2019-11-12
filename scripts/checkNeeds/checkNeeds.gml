//@description The checkNeeds() script will check a creature's needs. Needs will encompass a large variety of invididual needs, including if the creature is 
// immediately starving, the creature is being attacked, a threat is perceived to the creature, and more. The checkNeeds script will also check things such as if another member of the species
// is being attacked, if the species is looking for food as a whole, etc.

//@author Marcos Lacouture

//Precondition: checkNeeds(creature) is called with a reference to a creature as its parameter.
//Postcondition: Return an action with the creature's most urgent need. If the creature doesn't need anything, return the "idle" action.

var creature = argument[0];

var highestPriorityAction = instance_create_depth(0, 0, 5000, obj_action);

if (creature.hunger < (creature.maxHunger/100 * 60)) { //Low-priority search for food: If hunger hits 60% threshold
	highestPriorityAction.action = "findFood";
	highestPriorityAction.priority = 10;
} else {
	highestPriorityAction.action = "idle";
	highestPriorityAction.priority = 0;
}

return highestPriorityAction;
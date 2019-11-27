//@description The checkNeeds() script will check a creature's needs. Needs will encompass a large variety of invididual needs, including if the creature is 
// immediately starving, the creature is being attacked, a threat is perceived to the creature, and more. The checkNeeds script will also check things such as if another member of the species
// is being attacked, if the species is looking for food as a whole, etc.

//@author Marcos Lacouture

//Precondition: checkNeeds(creature) is called with a reference to a creature as its parameter.
//Postcondition: Return an action with the creature's most urgent need. If the creature doesn't need anything, return the "idle" action.

//FOR NOW, herbivores and omnivores have the same behavior. Change this in future.

var creature = argument[0];

var omnivore = 0; //constants for readability
var herbivore = 1;
var carnivore = -1;

if (instance_exists(creature) == true) { //Failsafe, in case a creature is deleted while this runs.
	var highestPriorityAction = instance_create_depth(0, 0, 5000, obj_action);

	if (creature.hunger < (creature.maxHunger/5)) { //Maximum priority search for food once hunger hits 20% threshold
		
		if (creature.diet == herbivore or creature.diet == omnivore) {
			highestPriorityAction.action = "findFood";	
			highestPriorityAction.priority = 100;
		} else {
			highestPriorityAction.action = "findFoodCarnivore";
			highestPriorityAction.priority = 100;
		}
		
	} else if (creature.hunger < (creature.maxHunger/100 * 80)) { //Low-priority search for food: If hunger hits 80% threshold
		if (creature.diet == herbivore or creature.diet == omnivore) { //Find herbivorous food
			
			if (creature.hunger < creature.maxHunger/100 * 60) { //Herbivorous creatures will start searching for food later than carnivorous ones, so the actual threshold is 60% hunger.
				highestPriorityAction.action = "findFood";
				highestPriorityAction.priority = 10;
			} else {
				highestPriorityAction.action = "idle";
				highestPriorityAction.priority = 0;
			}
			
		} else if (creature.diet == carnivore) { //Find carnivorous food and add it to the queue.
			highestPriorityAction.action = "findFoodCarnivore";
			highestPriorityAction.priority = 10;
		}
	} else {
		highestPriorityAction.action = "idle";
		highestPriorityAction.priority = 0;
	}
	
	if (highestPriorityAction.action != "idle") { //If you have an action that isn't idling,
		removeIdleActions(creature.actionsQueue); //Remove the idle action so that after the creature completes its action it doesn't try to return to its previous location.
	}

	return highestPriorityAction;
}
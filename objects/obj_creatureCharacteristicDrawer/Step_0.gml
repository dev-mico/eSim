/// @description Change what text is displayed depending on the creature's conditions.

//This is all self-explanatory code, so I'm not gonna comment this super thoroughly.

var highlightedCreature = global.highlightedCreature;


if (highlightedCreature == pointer_null) {
	String[0] = "No Creature Selected";

	String[1] = pointer_null;

	String[2] = pointer_null;

	String[3] = pointer_null;

	String[4] = pointer_null;

	String[5] = pointer_null;

	String[6] = pointer_null;

	String[7] = pointer_null;
	
	String[8] = pointer_null;
	
	String[9] = pointer_null;
} else if (instance_exists(highlightedCreature)) {
	String[0] = "Species: " + string(highlightedCreature.species);

	String[1] = "Attack: " + string(highlightedCreature.attack);

	String[2] = "Defense: " + string(highlightedCreature.defense);

	String[3] = "Dexerity: " + string(highlightedCreature.dexerity);

	String[4] = "Perception: " + string(highlightedCreature.perception);

	String[5] = "Stamina: " + string(highlightedCreature.stamina);

	var diet = "";
	if (highlightedCreature.diet == -1) {
		diet = "Carnivore";
	} else if (highlightedCreature.diet == 0) {
		diet = "Omnivore";
	} else {
		diet = "Herbivore";
	}
	
	String[6] = "Diet: " + diet;

	if (highlightedCreature.mutated == true) {
		String[7] = "Mutant!";
	} else {
		String[7] = "Not a mutant";
	}
	
	String[8] = "Aggressivity: " + string(highlightedCreature.aggressivity);
	
	if (ds_list_size(highlightedCreature.actionsQueue) > 0) { // Detect what action the creature is doing and display it
		
		var currentActionReference = ds_list_find_value(highlightedCreature.actionsQueue, 0);
		var currentAction = currentActionReference.action;
		
		String[9] = currentAction;
		if (currentAction == "idle" or currentAction == "idleMoveTo" or currentAction == "idleWait") {
			String[9] = "Idling";
		} else if (currentAction == "findFood" or currentAction == "findFoodMoveTo") {
			String[9] = "Looking for food";	
		}  else if (currentAction == "eat") {
			
			if (instance_exists(currentActionReference.arg1)) { //Check the creature still exists
				if (currentActionReference.arg1.object_index == foodBush.object_index) { //Check what the creature is eating
					String[9] = "Eating food";	
				} else { //If the creature is eating a creature, check if it's hunting it or just eating a corpse
					if (currentActionReference.arg1.dead == false) { //If it's alive, display "hunting"
						String[9] = "Hunting creature";
					} else { //Otherwise, display "eating corpse"
						String[9] = "Eating corpse";
					}
				}
			}
			
		} else if (currentAction == "fightOrFlight" or currentAction == "fightOrFlightProtect") {
			var fightOrFlee = currentActionReference.arg2;
			
			if (fightOrFlee == 0) { //If it's fighting back
				String[9] = "Fighting back against attacker";
			} else { //Otherwise, if it's running
				String[9] = "Running from attacker";	
			}
		}
	} else {
		String[9] = "Idling";	
	}
} else {
	global.highlightedCreature = pointer_null;	
}
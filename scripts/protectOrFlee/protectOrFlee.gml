// Precondition: protectOrFlee is called with 3 arguments: The creature doing the protecting, the creature attacking, and the creature to be protected.
// Postcondition: A boolean is returned, saying "true" to protect and "false" to flee from the attacker. If the creature being protected is running, this creature will be more likely to follow suit.
// If the creature is not running (fighting), this creature will also follow suit.

var creature = argument0;
var attacker = argument1;
var toProtect = argument2;

//arg2 of fightOrFlight stores to fight or flee (fight is 0, flee is 1).

var toProtect_fightOrFlee = -1;
for (var i = 0; i < ds_list_size(toProtect.actionsQueue); i++) { //This loop will iterate through and find whether toProtect is running or fighting, which is factored into calculations later.
	
	var currentAction = ds_list_find_value(toProtect.actionsQueue, i);
	
	if (currentAction.action == "fightOrFlight") {
		
		if (currentAction.arg1 = attacker) {
			toProtect_fightOrFlee = currentAction.arg2;	
		}
	}
	
}

if (toProtect_fightOrFlee == -1) { //If a fightOrFlight event doesn't exist (very rare, but may occur if a creature dies, for example), then just say 'flee' 
	return false;
}

var fightlikelihood = fightLikelihood(creature, attacker);

var randomNumber = random(100);

if (toProtect_fightOrFlee == 0) { //If the creature we are protecting is fighting back, make us more likely to fight back
	randomNumber += 25;
} else { //If it's running, make us more likely to run
	randomNumber -= 25;
}

if (randomNumber < fightlikelihood) {
	return true; //Fight
} else {
	return false; //Flee
}

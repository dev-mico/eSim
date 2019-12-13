//@description: fightOrFlight will return a boolean saying whether a creature should fight or flee.

// Precondition: fightOrFlight is called with two creatures as the arguments (creature1 and creature2).
// Postcondition: A boolean will be returned, representing whether creature1 should fight (true) or flee (false)

var creature = argument0;
var attacker = argument1;
var fightingBack = argument2; //If it's fighting back, set this to true


var fightlikelihood = fightLikelihood(creature, attacker, fightingBack);

var randomNumber = random(100);

if (randomNumber < fightlikelihood) {
	return true; //Fight
} else {
	return false; //Flee
}

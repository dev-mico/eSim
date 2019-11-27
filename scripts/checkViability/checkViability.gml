//@author Marcos Lacouture
//@description: checkViability will return a numerical value for how viable a creature is for another creature to hunt, based on differences in characteristics, pack size, and more.

//Precondition: Two arguments are passed: Creature (the creature who is hunting), and targetCreature (the creature that the viability is being checked for).
// An optional third argument may also be passed, beingAttacked, which is used strictly in the fightOrFlight() script.
//Postcondition: Return a numerical value with how viable a creature is for attacking. If beingAttacked is passed in, then don't take in account the target's likelihood to attack (as you are under attack by the target)

var creature = argument[0]; //The creature doing the hunting
var targetCreature = argument[1]; //The creature to compare "creature" to.

var distance = sqrt(sqr(creature.x - targetCreature.x) + sqr(creature.y - targetCreature.y));
var beingAttacked = false;

if (argument_count > 2) { //Optional argument: When set to true, the creature is being attacked (at least, hypothetically) by the target, which means the code will take in account the target's likelihood to be fight back in viability calculations.
	beingAttacked = argument[2]; 
} 

var currentCreatureAmount = ds_list_size(creature.creatureListReference);
var targetCreatureAmount = ds_list_size(targetCreature.creatureListReference);

var viability = 0; //Default is 0: At 0 viability, the creatures are considered equivalent.

var diffAttack = (creature.attack + (creature.speciesReference.avg_attack * (currentCreatureAmount - 1) ))/targetCreatureAmount - (targetCreature.attack + (targetCreature.speciesReference.avg_attack* (targetCreatureAmount-1) ))/currentCreatureAmount; //Multiply by the number of creatures as well every time to take population in account
//Use "avg_attack" since you are using the population average to approximate the pack's strength. The reason you divide by the opposite (i.e: targetCreatureAmount for the first one) is to have differences in population be more heavily weighted.

viability += diffAttack; //Attack has 100% weight
 
var diffDefense = (creature.defense + (creature.speciesReference.avg_defense * (currentCreatureAmount - 1) ))/targetCreatureAmount - (targetCreature.defense + (targetCreature.speciesReference.avg_defense * (targetCreatureAmount-1)))/currentCreatureAmount;
viability += ( (diffDefense * 80)/100); //Defense has 80% weight

var diffDexerity = creature.dexerity - targetCreature.dexerity;
//This will be utilized in code below, as dexerity's weight depends on the target's aggressivity.

//Stamina and perception do not need to be taken in account


viability -= ( (viability * 3 / 100) * (distance/50)); //Give distance some weight, but not a whole lot. Every 50 units away will subtract 3% viability.

//Take in account the target's probability of fighting back below.

if (beingAttacked == false) { //If the creature isn't being attacked by the target (at least hypothetically), take in account the target's likelihood to fight back and their likelihood to run.
	//This is essentially a recursive base case of sorts, since this function calls fightLikelihood which calls this function again.
	
	var fightChance = fightLikelihood(targetCreature, creature); //Get the likelihood of the target fighting back against the creature.
	var flightChance = 100 - fightChance;
		
	//Now, factor in the chance of running vs. fighting below.
	
	viability -= (diffDexerity*flightChance/100);
	
	//Dexerity matters ONLY if the creature's likely to run.	
}

//Next, take in account the creature's aggressivity

var aggressivity = creature.aggressivity;

var changeFactorAggressivity = power(abs(aggressivity), ( (1/abs(aggressivity)) + 1) );

if (aggressivity < 0) { //Account for the usage of absolute value. Absolute value is used so we don't need two different equations.
	changeFactorAggressivity *= -1;	
}

viability += (viability * changeFactorAggressivity);

//Take in account if the creature won't be satisfied by eating its target below.

var targetFood = targetCreature.currentFood;

if (targetFood < creature.maxHunger) { //If the creature wouldn't be fully satisfied hunting its target (an unlikely case), make the target less viable. This is the only case that matters.
	//Otherwise, do nothing since the creature being satisfied is really all that matters.
	
	viability *= (targetFood/creature.maxHunger);
}

return viability;
//@author Marcos Lacouture
//@description: checkViability will return a numerical value for how viable a creature is for another creature to hunt, based on differences in characteristics, pack size, and more.

//Precondition: Two arguments are passed: Creature (the creature who is hunting), and targetCreature (the creature that the viability is being checked for).
// An optional third argument may also be passed, beingAttacked, which is used strictly in the fightOrFlight() script.
//Postcondition: Return a numerical value with how viable a creature is for attacking. If beingAttacked is passed in, then don't take in account the target's likelihood to attack (as you are under attack by the target)


//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY), CREATURE AGGRESSIVITY
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY), CREATURE AGGRESSIVITY
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY), CREATURE AGGRESSIVITY
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY), CREATURE AGGRESSIVITY
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY), CREATURE AGGRESSIVITY



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

var diffAttack = (creature.attack*currentCreatureAmount) - (targetCreature.attack*targetCreatureAmount); //Multiply by the number of creatures as well every time to take population in account
viability += diffAttack; //Attack has 100% weight

var diffDefense = (creature.defense*currentCreatureAmount) - (targetCreature.defense*targetCreatureAmount);
viability += ( (diffDefense * 80)/100); //Defense has 80% weight

var diffDexerity = creature.dexerity - targetCreature.dexerity;
//This will be utilized in code below, as dexerity's weight depends on the target's aggressivity.

var diffPerception = creature.perception - targetCreature.perception;
//This will be utilized in code below, as perception's weight depends on the target's aggressivity.


//Stamina does not need to be taken in account


viability -= ( (viability * 3 / 100) * (distance/50)); //Give distance some weight, but not a whole lot. Every 50 units away will subtract 3% viability.

if (beingAttacked == false) { //If the creature isn't being attacked by the target, take in account the target's likelihood to fight back and their likelihood to run.
	
	var fightChance = fightLikelihood(targetCreature, creature); //Get the likelihood of the target fighting back against the creature.
	var flightChance = 100 - fightChance;
	
	show_debug_message("Well, the fight chance for " + targetCreature.species + " against " + creature.species + " is " + string(fightChance));
	
	//Now, factor in the chance of running vs. fighting below.
}

//Next, take in account the creature's aggressivity



/*if (targetCreature.aggressivity < 0) { //If the creature isn't aggressive, then factor how passive it is into how viable it is for hunting.
	
	//Essentially, what the calculations below do is that even if a creature is significantly more powerful, if it's really passive then it's more viable.
	//Low amounts of passivity have little to no impact. Pronounced impact begins at ~-0.6 aggressivity.
	
	var targetPass = -1 * targetCreature.aggressivity; //Multiply by negative one simply for the math, which uses passivity rather than aggressivity

	var viabilityChangeFactor =	power(targetPass, ( (1/targetPass) + 1) ); //Make the creature more likely to hunt a passive creature, more and more likely the closer the target's aggressivity is to -1
	//This equation above was determined in desmos. I looked at the graph, and essentially you will start to see an impact after aggressivity hits 0.3. 
	//25% impact at ~ -0.6, 50% impact at ~ -0.75, 75% imapct at ~ -0.88, and 100% impact at -1.

	viabilityChangeFactor *= 2.5; // multiply by 2.5 to give the target's passivity a LOT more weight.

	var tempViability = viability;
	
	if (tempViability < 0) { 
		tempViability *= -1; //Make the tempViability for the comparison positive, in all cases.
		//This is so you don't decrease viability rather than increase it if viability is negative.
	}
	
	viability += (tempViability * viabilityChangeFactor); //Add viability to itself, multiplied by the change factor (which is generally smaller than 1, depending on the case).

}*/





var targetFood = targetCreature.currentFood;

if (targetFood < creature.maxHunger) { //If the creature wouldn't be fully satisfied hunting its target (an unlikely case), make the target less viable. This is the only case that matters.
	//Otherwise, do nothing since the creature being satisfied is really all that matters.
	
	viability *= (targetFood/creature.maxHunger);
}

return viability;
//@author Marcos Lacouture
//@description: checkViability will return a numerical value for how viable a creature is for another creature to hunt, based on differences in characteristics, pack size, and more.

//Precondition: Two arguments are passed: Creature (the creature who is hunting), targetCreature (the creature that the viability is being checked for), and distance (the distance between the two creatures).
//Postcondition: Return a numerical value with how viable a creature is for hunting.

//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY)
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY)
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY)
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY)
//TO BE TAKEN IN ACCOUNT: RUNNING LIKELIHOOD (IN DEXERITY CATEGORY), LIKELIHOOD OF DETECTION BY TARGET (IN PERCEPTION CATEGORY)


var creature = argument[0]; //The creature doing the hunting
var targetCreature = argument[1]; //The creature to compare "creature" to.
var distance = argument[2]; //The only reason this is required is to perform one less operation: When this script is called, a distance will always already have been calculated to make sure the creature is within the sight range.

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

//BASE CALCULATIONS FOR FIGHT VS. FLIGHT ON THE CODE BELOW

if (targetCreature.aggressivity < 0) { //If the creature isn't aggressive, then factor how passive it is into how viable it is for hunting.
	
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

}

var targetFood = targetCreature.currentFood;

if (targetFood < creature.maxHunger) { //If the creature wouldn't be fully satisfied hunting its target (an unlikely case), make the target less viable. This is the only case that matters.
	//Otherwise, do nothing since the creature being satisfied is really all that matters.
	
	viability *= (targetFood/creature.maxHunger);
}

return viability;
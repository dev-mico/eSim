//Precondition: fightLikelihood is called with two creatures as the arguments.
//Postcondition: The likelihood of creature1 fighting back against creature2 is returned, depending on factors which are mostly determined in checkViability.

var creature1 = argument[0]
var creature2 = argument[1];

var guaranteedFightViability = 10; //This is to be tweaked throughout testing. Essentially, if the viability is this or higher, you will guaranteed fight back.
var guaranteedFlightViability = -10; //Again, tweak this throughout testing. If the viability is this or lower, 100% chance of running.


var viability = checkViability(creature1, creature2, true); //Pass optional argument, since you are checking the hypothetical (or real) situation where creature2 attacks creature1 and creature1 has to choose whether to fight back.

viability -= guaranteedFlightViability; //Center both viability and fight viability to be past 0 (think about it as a -1 to 1 domain being shifted over to 0 to 2 domain)
guaranteedFightViability -= guaranteedFlightViability; 

fightOdds = viability/guaranteedFightViability * 100;


//COMPLETELY IGNORE CREATURE2'S AGGRESSIVITY AND PASSIVITY!!!!

//Factor in creature1's aggressivity/passivity below.

var changeAmount = 0; //Change the odds of fighting by adding this. Determined below.
//Negative will decrease fight odds.

var aggressivity = creature1.aggressivity;

var changeFactor =	power(abs(aggressivity), ( (1/abs(aggressivity)) + 1) );

if (aggressivity < 0) { //changeFactor math uses absolute values so the same equation can be used.
	//Take in account negative aggressivity here.
	changeFactor *= -1;	
}

changeAmount = 50 * changeFactor;

fightOdds += changeAmount;

if (fightOdds > 100) {
	fightOdds = 100;	
} else if (fightOdds < 0) {
	fightOdds = 0;	
}

return fightOdds;

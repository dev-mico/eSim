//Precondition: detectsCreature is called with two creatures as the arguments.
//Postcondition: A boolean representing whether the first creature detected the second is returned (true if it did detect the second creature, called "target").
//detectsCreature takes in account perception and dexerity, as they are the two relevant skills to detecting creatures

var creature = argument[0];
var targetCreature = argument[1];

var targetDetectionOdds = 50;
var creatureDetected = true;

var targetSize = targetCreature.scaleFactor;
var targetDexerity = targetCreature.dexerity;
var perception = creature.perception;

targetDetectionOdds*= (targetSize/2);


var oddsChangeFactor = (perception - (targetDexerity * 1.5))/10; //The change factor. This is a percentage value, and will 
// change a percentage of the percentage (i.e: if this is 1/10, and there's a 70% detection chance, it will become a 77% detection chance, not an 80% one.)

targetDetectionOdds += (targetDetectionOdds * oddsChangeFactor);

if (targetDetectionOdds > 100) {
	targetDetectionOdds = 100;	
} else if (targetDetectionOdds < 1) {
	targetDetectionOdds = 1;
}

var detectRand = random_range(0, 100);

if (detectRand < targetDetectionOdds) {
	creatureDetected = true;
} else {
	creatureDetected = false;	
}

return creatureDetected;

//@Description calculate which body parts to use, based on a few arguments (characteristics).
//@author Marcos Lacouture

//Arguments: (attack, dexerity, defense, perception, stamina, developmentAmount, aggressivity, diet)

//Precondition: The method is called with all the required arguments, in the correct order.
//Postcondition: An array with the 3 body parts (head, body, and arms) is returned in that order. If there is no available body part that fits the constraints
// (e.g: You can't have any heads in the 'perception' category on a carnivore and the creature is a carnivore), choose a head based on the creature's diet.


var attack = argument[0];
var dexerity = argument[1];
var defense = argument[2];
var perception = argument[3];
var stamina = argument[4];
var developmentAmount = argument[5];
var aggressivity = argument[6];
var diet = argument[7];

var attackPercent = attack/(developmentAmount) * 100;
var dexerityPercent = dexerity/(developmentAmount) * 100;
var defensePercent = defense/developmentAmount * 100;
var perceptionPercent = perception/developmentAmount * 100;
var staminaPercent = stamina/developmentAmount * 100;

characteristics[0] = attackPercent;
characteristics[1] = dexerityPercent;
characteristics[2] = defensePercent;
characteristics[3] = perceptionPercent;
characteristics[4] = staminaPercent;

for (var i = 0; i < 5; i ++) { //Use two loops to order the array in increasing order
	for (var j = i + 1; j < 5; j++) {
		if (characteristics[i] > characteristics[j]) {
			var temp = characteristics[i];
			characteristics[i] = characteristics[j];
			characteristics[j] = temp;
		}
	}
}

characteristics_string[0] = ""; //Now fill an array with the most prominent characteristics, in ascending order.

characteristics_printed[0] = false; //This array will track whether attack percent, dexerity percent, etc. are printed, to avoid duplicates. 
for (var i = 0; i < 5; i++) {
	characteristics_printed[i] = false;	
} //Initialize the array

for (var i = 0; i < 5; i++) { //Add the ratios in ascending order (if attack is the most prevalent characteristic, it will be at the end).
	if (characteristics_printed[0] == false) and (characteristics[i] == attackPercent){ 
		characteristics_string[i] = "Attack";
		characteristics_printed[0] = true;
	} else if (characteristics_printed[1] == false) and (characteristics[i] == dexerityPercent) {
		characteristics_string[i] = "Dexerity";
		characteristics_printed[1] = true;
	} else if(characteristics_printed[2] == false) and  (characteristics[i] == defensePercent) {
		characteristics_string[i] = "Defense";
		characteristics_printed[2] = true;
	} else if(characteristics_printed[3] == false) and  (characteristics[i] == perceptionPercent) {
		characteristics_string[i] = "Perception";
		characteristics_printed[3] = true;
	} else if(characteristics_printed[4] == false) and  (characteristics[i] == staminaPercent) {
		characteristics_string[i] = "Stamina";
		characteristics_printed[4] = true;
	}
}

//Constants for legibility here.
var wolfHead = 0;
var boarHead = 1;
var angryReptileHead = 2;
var bunnyHead = 3;
var tRexHead = 4;
var deerHead = 5;
var deerHeadAntlers = 6;
var duckHead = 7;

var wolfBody = 0;
var boarBody = 1;
var tRexBody = 2;

var tRexArm = 0;

var omnivore = 0;
var herbivore = 1;
//-----------------------------------

//Constant arrays defined below for modularity
attackHeads[0] = tRexHead;
attackHeads[1] = wolfHead;
attackHeads[2] = angryReptileHead;
attackHeads[3] = boarHead;

dexerityHeads[0] = wolfHead;
dexerityHeads[1] = bunnyHead;
dexerityHeads[2] = tRexHead;
dexerityHeads[4] = deerHead;
dexerityHeads[5] = deerHeadAntlers;
dexerityHeads[6] = duckHead;

defenseHeads[0] = angryReptileHead;
defenseHeads[1] = boarHead;

perceptionHeads[0] = wolfHead;
perceptionHeads[1] = bunnyHead;
perceptionHeads[2] = deerHead;
perceptionHeads[3] = duckHead;

staminaHeads[0] = angryReptileHead;
staminaHeads[1] = boarHead;
staminaHeads[2] = deerHead;
staminaHeads[3] = deerHeadAntlers;

herbivoreHeads[0] = bunnyHead;
herbivoreHeads[1] = boarHead;
herbivoreHeads[2] = deerHead;
herbivoreHeads[3] = deerHeadAntlers;
herbivoreHeads[4] = duckHead;

omnivoreHeads[0] = boarHead;
omnivoreHeads[1] = wolfHead;
omnivoreHeads[2] = angryReptileHead;
omnivoreHeads[3] = deerHead;
omnivoreHeads[4] = deerHeadAntlers;
omnivoreHeads[5] = duckHead;

carnivoreHeads[0] = tRexHead;
carnivoreHeads[1] = wolfHead;
carnivoreHeads[2] = angryReptileHead;
carnivoreHeads[3] = boarHead;

attackBodies[0] = wolfBody;
attackBodies[1] = tRexBody;

dexerityBodies[0] = wolfBody;

defenseBodies[0] = boarBody;

perceptionBodies[0] = tRexBody;
perceptionBodies[1] = wolfBody;
perceptionBodies[2] = boarBody;

staminaBodies[0] = boarBody;
//--------------------------------------------

var sprite_body = 0;
var sprite_head = 0;
var sprite_arm = 0;

//Code for selecting head below. Head selection is based on the creature's second most prominent feature,
// as well as diet and, if possible, aggressivity.

headsPrimary = attackHeads; //headsPrimary will be the variable that tracks the list of heads around the creature's second most prevalent characteristic (attack, defense, etc.).

if (characteristics_string[3] == "Attack") { //Check the secondary characteristic
	headsPrimary = attackHeads;
} else if (characteristics_string[3] == "Defense") {
	headsPrimary = defenseHeads;
} else if (characteristics_string[3] == "Dexerity") {
	headsPrimary = dexerityHeads;
} else if (characteristics_string[3] == "Stamina") {
	headsPrimary = staminaHeads;
} else if (characteristics_string[3] == "Perception") {
	headsPrimary = perceptionHeads;
}

dietHeads = herbivoreHeads; //Same thing, but this variable will track the array with the heads of the diet.

if (diet == herbivore) {
	dietHeads = herbivoreHeads;
} else if (diet == omnivore) {
	dietHeads = omnivoreHeads;
} else {
	dietHeads = carnivoreHeads;	
}

//The reason we used headsPrimary and dietHeads is that we will have to check for overlap when selecting which head to use on a creature.
//If there is no overlap between the heads available for a creature's diet and the creature's main characteristic, then the head selection will be a random one based on the creature's diet.

if (elementsInCommonInt(headsPrimary, dietHeads) != -1) {
	sprite_head = getRandomElement(elementsInCommonInt(headsPrimary, dietHeads));
} else { //No elements in common between diet and primary characteristic; show this in an error but let the game continue to run.
	var dietString = "";
	if (diet == herbivore) {
		dietString = "Herbivore";
	} else if (diet == omnivore) {
		dietString = "Omnivore";
	} else {
		dietString = "Carnivore";
	}
	
	show_debug_message("No overlap between " + dietString + " and " + characteristics_string[4]);
	
	sprite_head = getRandomElement(dietHeads);
}

//Repeat the same process with bodies, except check the most prominent feature rather than the second most prominent.
//There is no need to compare bodies to diets, as diets are not body-specific.

bodiesPrimary = attackBodies;

if (characteristics_string[4] == "Attack") { //Check the primary characteristic
	bodiesPrimary = attackBodies;
} else if (characteristics_string[4] == "Defense") {
	bodiesPrimary = defenseBodies;
} else if (characteristics_string[4] == "Dexerity") {
	bodiesPrimary = dexerityBodies;
} else if (characteristics_string[4] == "Stamina") {
	bodiesPrimary = staminaBodies;
} else if (characteristics_string[4] == "Perception") {
	bodiesPrimary = perceptionBodies;
}

sprite_body = getRandomElement(bodiesPrimary);




//Repeat the same process for the arms

/*
PLACE HOLDER CODE: ONLY ONE PAIR OF ARMS
PLACE HOLDER CODE: ONLY ONE PAIR OF ARMS
*/

bodyParts[0] = sprite_head;
bodyParts[1] = sprite_body;
bodyParts[2] = sprite_arm;

return bodyParts;
//@description Create a new species
//@author Marcos Lacouture

/*  Precondition: createNewSpecies is called with parameters developmentAmount (an integer) and diet (an integer). Diet will represent the creature's diet. -1 means that this characteristic
    should be randomly generated. InitialDevelopment will represent the amount of 'skill points' to be randomly distributed between a creature's characteristics (attack, defense, etc.)

	Postcondition: A new, randomized species object is created and its reference is added to the global speciesList.
*/

var name = generateSpeciesName();
var developmentAmount = argument[0];
var diet = argument[1];

if (diet == 2) { //If 2 (signifies random), choose a random diet: omnivore, herbivore, or carnivore.
	diet = irandom_range(1, 4) - 2; //iRandom won't give you 0; compensate for this
	if (diet > 1) { //Before, the odds of having a herbivore randomly generated were low because of how irandom works. Compensate for it by making it generate numbers bigger than 1.
		diet = 1;	
	}
}

var avg_dexerity = 1; //Dexerity impacts a species' speed and their ability to avoid detection
var avg_attack = 1; //Attack is how much damage a species does to enemies.
var avg_defense = 1; //Defense is how much health a creature has
var avg_perception = 1; //Perception is how likely a species is to locate aggressive creatures and food. The higher this is, the more likely it is to detect a nearby, or even far-off, meal or threat.
var avg_stamina = 1; //Stamina is a measure of how long creatures can go without food and rest. Higher stamina will result in lower calorie consumption.

//The above values are averages because every species has some variation in speed, attack, and defense between parents to children.

for (var i = 0; i < developmentAmount; i++) { //Distribute developmentAmount points to the five different categories.
	randomize();
	
	var toAddTo = round(random(4) + 1); //call trueRandom script. This will give much more variation between random numbers
	
	
	if (toAddTo == 1) {
		avg_dexerity+=1;
	} else if (toAddTo ==2) {
		avg_attack+=1;
	} else if (toAddTo == 3) {
		avg_defense += 1;
	} else if (toAddTo ==4) { 
		avg_perception +=1;
	} else {
		avg_stamina += 1;
	}
}

newSpecies = instance_create_depth(0,0,0,Species); //Arguments: x, y, depth, index of object. X and Y are irrelevant, as this object is invisible.

developmentAmount+=5; //take in account the first stats, which all start at 1.

//Initialize all newSpecies variables
newSpecies.avg_diet = diet; //start on herbivore if its the initial generation, as all creatures will start on herbivore by default.
newSpecies.avg_attack = avg_attack;
newSpecies.avg_dexerity = avg_dexerity;
newSpecies.avg_defense = avg_defense;
newSpecies.avg_perception = avg_perception;
newSpecies.avg_stamina = avg_stamina;
newSpecies.name = name;
newSpecies.avg_aggressivity = random_range(-70, 70)/100;
newSpecies.avg_development = developmentAmount;
newSpecies.avg_color = make_colour_rgb(random_range(30,220), random_range(30, 240), random_range(30 ,200)); //randomize creature color
newSpecies.creatures = ds_list_create();


bodyParts = calculateBodyParts(avg_attack, avg_dexerity, avg_defense, avg_perception, avg_stamina, developmentAmount, newSpecies.avg_aggressivity, newSpecies.avg_diet);

newSpecies.avg_sprite_head = bodyParts[0];
newSpecies.avg_sprite_body = bodyParts[1];
newSpecies.avg_sprite_arm = bodyParts[2];

//Debugging code below, just to show everything was distributed properly.


/*show_debug_message(name);
show_debug_message("-------------");
show_debug_message("Attack: " + string(newSpecies.avg_attack));
show_debug_message("Dexerity: " + string(newSpecies.avg_dexerity));
show_debug_message("Defense: " + string(newSpecies.avg_defense));
show_debug_message("Perception: " + string(newSpecies.avg_perception));
show_debug_message("Stamina: " + string(newSpecies.avg_stamina));
show_debug_message("Diet: " + string(newSpecies.avg_diet));
show_debug_message("Aggressivity: " + string(newSpecies.avg_aggressivity));

show_debug_message("Head: " + string(bodyParts[0]));
show_debug_message("Body: " + string(bodyParts[1]));
show_debug_message("Arms: " + string(bodyParts[2]));*/


newSpecies.persistent = true; //Temporarily make it persistent so it isn't deleted upon room change
ds_list_add(global.speciesList, newSpecies);
show_debug_message("Species list size: " + string(ds_list_size(global.speciesList)));
//@description recalculateSpeciesAverages will recalculate any values with an 'avg' before them based on all of the creatures that are alive.
//@author: Marcos Lacouture

//Precondition: recalculateSpeciesAverages() is called, with a species as its parameter.
//Postcondition: All values with 'avg' before them are recalculated, based on the average of the respective values (e.g: calculate avg_attack based on the average of the attack of every creature in the species).

species = argument[0];
creatures = species.creatures;

var avg_attack = 0;
var avg_defense = 0;
var avg_dexerity = 0;
var avg_stamina = 0;
var avg_perception = 0;
var avg_aggressivity = 0;
var avg_development = 0;

for (var i = 0; i < ds_list_size(creatures); i++) { //First, tally up the total of each variable.
	currentCreature = ds_list_find_value(creatures, i);
	avg_attack += currentCreature.attack;
	avg_defense += currentCreature.defense;
	avg_dexerity += currentCreature.dexerity;
	avg_stamina += currentCreature.stamina;
	avg_perception += currentCreature.perception;
	avg_aggressivity += currentCreature.aggressivity;
	avg_development += currentCreature.development;
}

//Then divide the total of each variable by the number of creatures to find the average.
avg_attack /= ds_list_size(creatures);
avg_defense /= ds_list_size(creatures);
avg_dexerity /= ds_list_size(creatures);
avg_stamina /= ds_list_size(creatures);
avg_perception /= ds_list_size(creatures);
avg_aggressivity /= ds_list_size(creatures);
avg_development /= ds_list_size(creatures);



//Average diet must be calculated differently, as numeric values represent different things; if you got the average of a carnivore and herbivore, 
//The code would think the species is a species of omnivores.
//Instead, get the mode of the diets and have this be the "avg_diet." Code for that is below.
var carnivoreCount = 0;
var omnivoreCount = 0;
var herbivoreCount = 0;

for (var i = 0; i < ds_list_size(creatures); i++) { //First, tally up the number of herbivores, carnivores, and omnivores.
	currentCreature = ds_list_find_value(creatures, i);
	var diet = currentCreature.diet;
	if (diet == -1) { //If it's a carnivore
		carnivoreCount++;	
	} else if (diet == 0) { //If it's an omnivore
		omnivoreCount++;
	} else {
		herbivoreCount++;	
	}
}


var avg_diet = 0; //-1 carnivore, 0 omnivore, 1 herbivore
//show_debug_message("Carnivore Count: " + string(carnivoreCount));
//show_debug_message("Herbivore Count: " + string(herbivoreCount));
//show_debug_message("Omnivore Count: " + string(omnivoreCount));

if (omnivoreCount >= carnivoreCount) and (omnivoreCount >= herbivoreCount) { //If the omnivores are the most prevalent diet, the diet is the omnivores.
	avg_diet = 0;
} else if (herbivoreCount >= omnivoreCount) and (herbivoreCount >= carnivoreCount) { //If the herbivores are the most prevalent diet, set it to herbivore
	avg_diet = 1;
} else { //Otherwise, it's the carnivores, so set the avg_diet to carnivores.
	avg_diet = -1;
}

//For calculating sprite_color averages, you need to get the average of the 3 RGB components: Red, green, and blue.
var avg_red = 0;
var avg_green = 0;
var avg_blue = 0;

for (var i = 0; i < ds_list_size(creatures); i++) { // Tally the total values in each sprite_color category
	currentCreature = ds_list_find_value(creatures, i);
	currentColor = currentCreature.sprite_color;
	avg_red += colour_get_red(currentColor);
	avg_green += colour_get_green(currentColor);
	avg_blue += colour_get_blue(currentColor);
}

avg_red /= ds_list_size(creatures); //Divide it by the amount of creatures to get the average in each sprite_color
avg_green /= ds_list_size(creatures);
avg_blue /= ds_list_size(creatures);

var avg_color = make_colour_rgb(avg_red, avg_green, avg_blue);

//Below, you have to get the average sprite body parts. Like diet, you can't just calculate an average traditionally.
//To get the 'average' for this, we must use the mode of the sprite heads.

headTally = ds_map_create(); //Use a map for this: Store each body part and the amount of this body part that appears
bodyTally = ds_map_create();
armTally = ds_map_create();

//The keys in this map represent each head's integer value, and the values they are connected to represent the count of the given head in the species.
for (var i = 0; i < ds_list_size(creatures); i++) { //Tally the frequency with which each head appears.
	currentCreature = ds_list_find_value(creatures, i);
	var head = currentCreature.sprite_head;
	var body = currentCreature.sprite_body;
	var arm = currentCreature.sprite_arm;
	
	if (ds_map_exists(headTally, head)) { //If there is already a head of this type, then add to the count of it (the value).
		ds_map_replace(headTally, head, (ds_map_find_value(headTally, head) + 1));
	} else { //If you haven't encountered any head of this type, create a new key with the head's integer value and make the count 1.
		ds_map_add(headTally, head, 1);
	}
	
	if (ds_map_exists(bodyTally, body)) { //Repeat the same exact process, but with bodies.
		ds_map_replace(bodyTally, body, (ds_map_find_value(bodyTally, body) + 1));
	} else { 
		ds_map_add(bodyTally, body, 1);
	}
	
	if (ds_map_exists(armTally, arm)) { //Repeat the same exact process, but with arms.
		ds_map_replace(armTally, arm, (ds_map_find_value(armTally, arm) + 1));
	} else { 
		ds_map_add(armTally, arm, 1);
	}
	
}

//Next, find for each body part which body part is the most prominent (e.g: If there are the most heads in head type 5, then set the avg_head to 5).
var currentKey = ds_map_find_first(headTally); //To iterate through a ds_map in GMS, you need to use 'next,' kind of like a linked list.
var highestValueKey = currentKey;
var highestValue = ds_map_find_value(headTally, highestValueKey);

for (var i = 1; i < ds_map_size(headTally); i++) { //Iterate through the head tally and find what the most frequent body part is.
	//Start at 1 since you already performed this operation on the first key.
	currentKey = ds_map_find_next(headTally, currentKey);
	var currentValue = ds_map_find_value(headTally, currentKey);
	if (currentValue > highestValue) {
		highestValue = currentValue;
		highestValueKey = currentKey;
	}
}

var avg_sprite_head = highestValueKey; //Set the head to the most frequently repeating head.

//Repeat the same process with the body below.
var currentKey = ds_map_find_first(bodyTally);
var highestValueKey = currentKey;
var highestValue = ds_map_find_value(bodyTally, highestValueKey);

for (var i = 1; i < ds_map_size(bodyTally); i++) { //Repeat the same operation with the body.
	currentKey = ds_map_find_next(bodyTally, currentKey);
	var currentValue = ds_map_find_value(bodyTally, currentKey);
	if (currentValue > highestValue) {
		highestValue = currentValue;
		highestValueKey = currentKey;
	}
}

var avg_sprite_body = highestValueKey;

//Finally, repeat the same process with the arm.

var currentKey = ds_map_find_first(armTally);
var highestValueKey = currentKey;
var highestValue = ds_map_find_value(armTally, highestValueKey);

for (var i = 1; i < ds_map_size(armTally); i++) { //Repeat the same operation with the body.
	currentKey = ds_map_find_next(armTally, currentKey);
	var currentValue = ds_map_find_value(armTally, currentKey);
	if (currentValue > highestValue) {
		highestValue = currentValue;
		highestValueKey = currentKey;
	}
}

var avg_sprite_arm = highestValueKey;

//Now that all the averages are calculated, change the species' averages to be the same as the ones we calculated.
species.avg_attack = avg_attack;
species.avg_defense = avg_defense;
species.avg_dexerity = avg_dexerity;
species.avg_stamina = avg_stamina;
species.avg_perception = avg_perception;
species.avg_aggressivity = avg_aggressivity;

species.avg_diet = avg_diet;

species.avg_color = avg_color; 

species.avg_sprite_head = avg_sprite_head;
species.avg_sprite_body = avg_sprite_body;
species.avg_sprite_arm = avg_sprite_arm;
species.avg_development = avg_development;

/*
Debug code for showing everything works below

show_debug_message(species.name + " recalculated averages");
show_debug_message("-------------");
show_debug_message("Attack: " + string(species.avg_attack));
show_debug_message("Dexerity: " + string(species.avg_dexerity));
show_debug_message("Defense: " + string(species.avg_defense));
show_debug_message("Perception: " + string(species.avg_perception));
show_debug_message("Stamina: " + string(species.avg_stamina));
show_debug_message("Diet: " + string(species.avg_diet));
show_debug_message("Aggressivity: " + string(species.avg_aggressivity));

show_debug_message("Head: " + string(species.avg_sprite_head));
show_debug_message("Body: " + string(species.avg_sprite_body));
show_debug_message("Arms: " + string(species.avg_sprite_arm));
show_debug_message("Color: (" + string(colour_get_red(species.avg_color)) + "," + string(colour_get_green(species.avg_color)) + "," + string(colour_get_blue(species.avg_color)) +")");
*/
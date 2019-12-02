//Precondition: reproduce() function is called with a single creature as its parameter.
//Postcondition: An egg is created with the proper size and color, as outlined by the parent and the species' averages.

var species = argument0;

var parent = ds_list_find_value(species.creatures, random(ds_list_size(species.creatures) - 0.5))
//Get a random creature for the parent

//Create an egg
egg = instance_create_layer(parent.x, parent.y, "EggLayer", obj_egg);

if (global.initialCreatureAmount >= 1) {
	if (ds_list_size(species.creatures) >= global.creatureLimit) { //Upper limit (4x initial size) on population, kill the oldest creature
		var toKill = ds_list_find_value(species.creatures, 0);
		toKill.creatureHealth = 0;
	}
}

egg.parent = parent;
egg.species = species;
egg.alarm[0] = 5; //Initialize the egg
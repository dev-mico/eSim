/// @description Failsafe alarm: Upon creation of the species, if any creatures are deleted, relocate the entire species and re-create the creatures.

var invalidInstance = false; 

for (var i = 0; i < ds_list_size(creatures); i++) {
	if (instance_exists(ds_list_find_value(creatures, i)) == false) {
		invalidInstance = true;	
	}
}

while (invalidInstance == true) { //If an invalid instance is found, re-create the species until there are no more invalid instances.
	
	for (var i = 0; i < ds_list_size(creatures); i++) { //Free up memory space
		instance_destroy(ds_list_find_value(creatures, i));	
	}
	
	ds_list_clear(creatures);
	
	startX = random(room_width);
	startY = random(room_height);
	
	var creatureSpawnAmount = initialCreatureAmount;
	
	if (creatureSpawnAmount < 1) {
		creatureSpawnAmount = irandom_range(7, 9);
	}
	
	for (var j = 0; j < creatureSpawnAmount; j++) { //Create the creatures
		instantiateCreature(id, (startX + (30 * random_range(-1, 1))), (startY + (30 * random_range(-1, 1))) );
	}
	
	
	for (var i = 0; i < ds_list_size(creatures); i++) { //Check all instances are valid
		if (instance_exists(ds_list_find_value(creatures, i)) == false) {
			invalidInstance = true;	
		}
	}
}
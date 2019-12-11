/// @description Move up in higlighted creature


if (global.highlightedCreature != pointer_null) { //If a creature is selected
	playSound(menuBeep);
	
	var creaturesList = global.highlightedCreature.creatureListReference;

	var creatureIndex = ds_list_find_index(creaturesList, global.highlightedCreature);

	if (creatureIndex == ds_list_size(creaturesList) - 1) { //If you are at the end of the creatures list, move to the next species' first member
		var speciesIndex = ds_list_find_index(global.speciesList, global.highlightedCreature.speciesReference);
	
		if (speciesIndex == (ds_list_size(global.speciesList) - 1)) { //If you are at the end of the species list, go to the first species
			speciesIndex = 0;
		} else { //Otherwise, move to the next species
			speciesIndex ++;	
		}
	
		var species = ds_list_find_value(global.speciesList, speciesIndex);
	
		global.highlightedCreature = ds_list_find_value(species.creatures, 0); //Start at the first creature
	
	} else { // Otherwise, move to the next creature
		global.highlightedCreature = ds_list_find_value(creaturesList, creatureIndex + 1);
	}
}
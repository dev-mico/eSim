/// @description Move down in higlighted creature


if (global.highlightedCreature != pointer_null) { //If a creature is selected
	playSound(menuBeep);
	
	var creaturesList = global.highlightedCreature.creatureListReference;

	var creatureIndex = ds_list_find_index(creaturesList, global.highlightedCreature);

	if (creatureIndex == 0) { //If you are at the end of the creatures list, move to the previous species' last member
		
		var speciesIndex = ds_list_find_index(global.speciesList, global.highlightedCreature.speciesReference);
	
		if (speciesIndex == 0) { //If you are at the end of the species list, go to the last species
			speciesIndex = ds_list_size(global.speciesList) - 1;
		} else { //Otherwise, move to the next species
			speciesIndex--;	
		}
	
		var species = ds_list_find_value(global.speciesList, speciesIndex);
	
		global.highlightedCreature = ds_list_find_value(species.creatures, ds_list_size(species.creatures) - 1); //Start at the last creature
	
	} else { // Otherwise, move to the next creature
		global.highlightedCreature = ds_list_find_value(creaturesList, creatureIndex - 1);
	}
}
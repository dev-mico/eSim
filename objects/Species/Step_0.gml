/// @description Reproduction is managed here

if (room == SimulationRoom) {
	if (ds_list_size(creatures) > 0) { //If the species isn't extinct
		if (global.paused == false) {
			if (reproductionCountdown > 0) { //Count down to the next reproduction
				reproductionCountdown -= global.timeScale;
			} else {
				reproduce(id);
				reproductionCountdown = irandom_range(reproductionCountdownMinimum, reproductionCountdownMax);
			}
		}
	} else { //Delete the species object once it's extinct
		var eggOfSpecies = false;
		
		with (obj_egg) { //Species is not yet extinct if an egg exists of the species.
			if (species == id) {
				eggOfSpecies = true;	
			}
		}
		
		if (eggOfSpecies == false) {
			ds_list_delete(global.speciesList, ds_list_find_index(global.speciesList, id)); 
			ds_list_destroy(creatures);
			instance_destroy(id);
		}
	}
}
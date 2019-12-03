/// @description Insert description here
display_set_gui_size(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));

if (global.paused == false) {
	speciesCreationCountdown-= global.timeScale;
	
	if (speciesCreationCountdown <= 0) { //Once you hit the creation countdown, create a new species
		speciesCreationCountdown = irandom_range(speciesCreationCountdownMin, speciesCreationCountdownMax);
		var avgDevelopment = 0;
		var avgCreatureAmount = 0;
		
		for (var i = 0; i < ds_list_size(global.speciesList); i++) { //Get the average development and creature amount by first adding up all development
			var currentSpecies = ds_list_find_value(global.speciesList, i);
			avgDevelopment += currentSpecies.avg_development;
			avgCreatureAmount += ds_list_size(currentSpecies.creatures);
		}
		
		avgDevelopment /= ds_list_size(global.speciesList); //After this, divide by the amount of species to find the average development.
		avgDevelopment *= random_range(0.8, 1.2); //+- 20% development, so it's not too much
		
		avgCreatureAmount /= ds_list_size(global.speciesList); //Do the same with the creature amount
		avgCreatureAmount *= random_range(0.8, 1.2);
		avgCreatureAmount = round(avgCreatureAmount); //Create an integer number of creatures by rounding this number
		
		newSpecies = createNewSpecies(avgDevelopment, 2); //2 means random diet
		
		//Next, create the creatures from each species.
		for (var i = 0; i < avgCreatureAmount; i++) {
			instantiateCreature(newSpecies, room_width/2, room_height/2);
		}
	}
}
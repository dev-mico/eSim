/// @description Migration is managed here


if (global.paused == false) {
	if (ds_list_size(global.speciesList) < global.speciesLimit) { //Do not migrate in new species if you are at your limit
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
			avgDevelopment = irandom_range(5, avgDevelopment); //Prevent there being a ton of giant creatures by making smaller creatures more prevalent
			avgDevelopment *= random_range(0.4, 1.6); //+- 60% development- this results in a lot of variety, specifically when there are larger creatuers
			
			if (avgDevelopment <= 0) { //Don't make the simulation just stop after nothing is left
				avgDevelopment = global.initialDevelopmentAmount;	
			}
		

			avgCreatureAmount /= ds_list_size(global.speciesList); //Do the same with the creature amount
			avgCreatureAmount *= random_range(0.8, 1.3); //Increase high range to make up for the lack of larger creatures
			avgCreatureAmount = round(avgCreatureAmount); //Create an integer number of creatures by rounding this number
		
			
		
			newSpecies = createNewSpecies(avgDevelopment, 2); //2 means random diet
		
			var enterFrom = irandom_range(1, 4); //1 is north, 2 is south, 3 is west, 4 is east

			var enterFromConstant = 60; //constant for readability. How far outside of the game world creatures will spawn, and how far in they'll move into the game world.
		
			//Next, create the creatures from the species
		
			var packX = 0; //packX and packY are the pack's starting X and Y positions (outside of the game world)
			var packY = 0;

			if (enterFrom == 1) or (enterFrom == 2) { //If entering from the north or south, define a random X position for the species to come in from
				packX = random_range(enterFromConstant, room_width - enterFromConstant)
			} else  { //If entering from the west or the east, define a random Y position for the species to come in from
				packY = random_range(enterFromConstant, room_height - enterFromConstant);
			}
		
		
			for (var i = 0; i < avgCreatureAmount; i++) {
				var newAction = instance_create_layer(0, 0, "InvisibleObjects", obj_action);
				newAction.priority = 150;
				newAction.action = "idleMoveTo"; //Most simple moveTo action, just use this to get the creatures into the game world.
			
				if (enterFrom == 1) { //Enter from the north
				
					var creature = instantiateCreature(newSpecies, packX, -1 * enterFromConstant);
					newAction.arg1 = packX;
					newAction.arg2 = enterFromConstant;
				
				} else if (enterFrom == 2) {//Enter from the south
				
					var creature = instantiateCreature(newSpecies, packX, room_height + enterFromConstant);
					newAction.arg1 = packX;
					newAction.arg2 = room_height - enterFromConstant;
				
				} else if (enterFrom == 3) { //Enter from west
				
					var creature = instantiateCreature(newSpecies, -1 * enterFromConstant, packY);
					newAction.arg1 = enterFromConstant;
					newAction.arg2 = packY;
				
				} else { //Enter from the east
				
					var creature = instantiateCreature(newSpecies, room_width + enterFromConstant, packY);
					newAction.arg1 = room_width - enterFromConstant;
					newAction.arg2 = packY;
				
				}
			
				ds_list_add(creature.actionsQueue, newAction);
			}
		}
	}
}
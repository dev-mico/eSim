//@author Marcos Lacouture
/*findFoodCarnivore will find food for a carnivore (or eventually, omnivore) within the creature's perceptive range.
* The function takes in account the creature's aggressivity when determining whether the creature will hunt for food or scavenge, as well as 
* using aggressivity and the creature's traits to determine how bold it is in hunting larger creatures.
*/


// TO BE IMPLEMENTED: TAKE IN ACCOUNT DEXERITY IN DETECTION
// TO BE IMPLEMENTED: TAKE IN ACCOUNT DEXERITY IN DETECTION
// TO BE IMPLEMENTED: TAKE IN ACCOUNT DEXERITY IN DETECTION
// TO BE IMPLEMENTED: TAKE IN ACCOUNT DEXERITY IN DETECTION
// TO BE IMPLEMENTED: TAKE IN ACCOUNT DEXERITY IN DETECTION

var creature = argument[0];
var sightRange = argument[1];

closestCorpseFound = pointer_null; //Check for corpses first.
closestCorpseDistance = 99999999;


/*if (creature.aggressivity < 0.65) { //If the creature is very aggressive (more than 0.65), it will not scavenge. If it is not this aggressive, however, it will scavenge (try to find an already dead corpse) first before trying to hunt.
	for (var i = 0; i < ds_list_size(global.corpseList); i++) {
		var currentCorpse = ds_list_find_value(global.corpseList, i);
		var distanceFromCurrent = sqrt(sqr(creature.x - currentCorpse.x) + sqr(creature.y - currentCorpse.y));
		
		if (distanceFromCurrent < closestCorpseDistance) { //Go for the closest corpse.
				closestCorpseFound = currentCorpse;
				closestCorpseDistance = distanceFromCurrent;
		}
		
	}
}*/

if (closestCorpseFound == pointer_null) { // If no corpses are found or the creature chooses not to look for any, have the creature consider hunting a living creature.
	
	mostViableCreature = pointer_null;
	highestViability = 0; //"Viability" will determine whether or not a creature is a viable target for hunting.
	//This is determined by the creature and target's combat-relevant characteristics, as well as the creature's aggressivity, the amount of creatures in the other species, its distance away, etc.
	
	for (var i = 0; i < ds_list_size(global.speciesList); i++) { // For every species
	
		var currentSpecies = ds_list_find_value(global.speciesList, i);
	
		if (currentSpecies.name != creature.species) { //Don't hunt creatures of your own species
			var creatures = currentSpecies.creatures;
	
			for (var j = 0; j < ds_list_size(creatures); j++) { //For each creature in each species
				var targetCreature = ds_list_find_value(creatures, j);
		
				var distanceFromCreature = sqrt(sqr(creature.x - targetCreature.x) + sqr(creature.y - targetCreature.y));
	
				if (distanceFromCreature<= sightRange) { //if the creature can see the target
					if (targetCreature.x <  (room_width - (creature.creatureWidth/8))) and (targetCreature.x > (creature.creatureWidth/8)) {
				
						if (targetCreature.y < room_height - (creature.creatureHeight/8)) and (targetCreature.y > (creature.creatureHeight/8))  { //If the creature can access the target
							show_debug_message(creature.species + " viability when hunting " + targetCreature.species + ":" +  string(checkViability(creature, targetCreature))); //checkViability will get how viable a target is for hunting based on a variety of factors.
							//var viability = 0;
							
							/*if (viability > highestViability) { //If you find a more viable target for hunting, set that target as priority.
								highestViablity = viability;
								mostViableCreature = targetCreature;
							}	*/
						}
				
					}
			
				}
			}
			
		}
	
	}
}
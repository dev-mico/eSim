//@description: Instantiate a creature of a given species, and initialize all its variables.
//@author: Marcos Lacouture

//Precondition: instantiateCreature_Parent() is called with a species as a parameter, followed by an x and y coordinate for the creature to be spawned at, followed by the creature's parent.
//Postcondition: A creature is instantiated, and its variation from the species' averages is taken in account and averaged with the parent's characteristics.

var species = argument0;
var creatureX = argument1;
var creatureY = argument2;
var parent = argument3;

if (species.object_index == Species) { //First, check you actually have a species object passed in.
	//Set the base values below
	creature = instance_create_layer(creatureX, creatureY, "CreatureLayer", obj_creature);
	creature.species = species.name;
	creature.speciesReference = species;
	creature.sprite_body = parent.sprite_body;
	creature.sprite_head = parent.sprite_head;
	creature.sprite_arm = parent.sprite_arm;
	creature.sprite_color = parent.sprite_color;

	creature.attack = (species.avg_attack+parent.attack)/2; //These characteristics are based on averages
	creature.defense = (species.avg_defense+parent.defense)/2;
	creature.perception = (species.avg_perception+parent.perception)/2;
	creature.dexerity = (species.avg_dexerity+parent.dexerity)/2;
	creature.stamina = (species.avg_stamina+parent.stamina)/2;
	creature.aggressivity = (species.avg_aggressivity + parent.aggressivity)/2;
	
	creature.diet = parent.diet; //Inherit the parent's diet
	
	/*All code below here will slightly variate the creature's characteristics.
	  Variation will be based on total development and a variation factor, which will increase if there is a mutation.
	  Mutations are rare instances where a creature's variation from its parents is greater than the average variation. If a mutation occurs, a physical characteristic (head, body, or arms) will be recalculated as well,
	  To represent the mutation in visual terms. Color and diet will also be recalculated.
	*/

	var mutated = false; 

	if (round(random(100)) <= global.mutationChance) { // 1 in 10 chance that you have a mutation
		mutated = true;
	}

	var VARIATIONBASELINE = 30; //This is a constant for readability, so its easy to tweak. 
	//This is the 'baseline' for variation: I.e: At this variation's avg_development, you will have a maximum of 1 point of variation per characteristic.

	var pointVariation = species.avg_development/VARIATIONBASELINE; //If you have VARIATIONBASELINE total development, you will have a maximum of 1 point of variation per characteristic. 

	if (mutated == true) {
		pointVariation *= 3; //Mutations have 3x the average variation	
		
		creature.diet += irandom_range(-1, 1);
		creature.diet = round(creature.diet);
		if (creature.diet < -1) {
			creature.diet = -1;
		} else if (creature.diet > 1) {
			creature.diet = 1;
		}
	}

	//Variation of traits occurs below.
	creature.attack += random_range((-1 * pointVariation), pointVariation);
	creature.defense += random_range((-1 * pointVariation), pointVariation);
	creature.dexerity += random_range((-1 * pointVariation), pointVariation);
	creature.perception += random_range((-1 * pointVariation), pointVariation);
	creature.stamina += random_range((-1 * pointVariation), pointVariation);
	creature.aggressivity += random_range(-0.1, 0.1); //Aggressivity variation must be the same for all creatures

	if (creature.aggressivity < -1) { //Aggressivity must be between -1 and 1.
		creature.aggressivity = -1;
	} else if (creature.aggressivity >1) {
		creature.aggressivity = 1;	
	}

	//Calculate actual creature development, the sum of all of the 'skill points.'
	var creatureDevelopment = 0; 
	creatureDevelopment += creature.attack;
	creatureDevelopment += creature.defense;
	creatureDevelopment += creature.dexerity;
	creatureDevelopment += creature.perception;
	creatureDevelopment += creature.stamina;

	creature.development = creatureDevelopment;

	if (mutated == true) { //On mutation, recalculate a physical characteristic (body, head, or arms).
		var head = 0;
		var body = 1;
		var arm = 2;
		var bodypartToChange = round(random_range(0, 3));
		bodyParts = calculateBodyParts(creature.attack, creature.dexerity, creature.defense, creature.perception, creature.stamina, creature.development, creature.aggressivity, creature.diet);
		
		if (bodypartToChange == head) {
			creature.sprite_head = bodyParts[head];
		} else if (bodypartToChange == body) {
			creature.sprite_body = bodyParts[body];
		} else if (bodypartToChange == arm){
			creature.sprite_arm = bodyParts[arm];
		}
		creature.mutated = true;
		var textColor = make_colour_rgb(0, 255, 0);
		drawFloatingText("Mutation!", creatureX, creatureY, textColor, 1, 1); //Draw the floating "Mutation!" text that shows up when a mutant creature is born.
		
		var red = colour_get_red(creature.sprite_color);
		var blue = colour_get_blue(creature.sprite_color);
		var green = colour_get_green(creature.sprite_color);
		
		creature.sprite_color = make_colour_rgb(red + random_range(-100,100), blue + random_range(-100, 100), green + random_range(-100 , 100));
	}

	ds_list_add(species.creatures, creature); //Must add the instantiated creature to the list of creatures in the Species object.
	creature.creatureListReference = species.creatures; //Add the reference to the species' list, so that when the creature dies, you can remove it from the list of creatures.
	recalculateSpeciesAverages(species); //Recalculate species' avg values, taking in account the new creature.

	creature.alarm[0] = 1; //Initialization of creature occurs in obj_creature's alarm 0 event.

	/*
	Debugging code below (show all characteristics of each creature)
	show_debug_message("Creature of " + creature.species + " species.");
	show_debug_message("--------------------");
	show_debug_message("Attack: " + string(creature.attack));
	show_debug_message("Defense: " + string(creature.defense));
	show_debug_message("Dexerity: " + string(creature.dexerity));
	show_debug_message("Perception: " + string(creature.perception));
	show_debug_message("Stamina: " + string(creature.stamina));
	show_debug_message("Aggressivity: " + string(creature.aggressivity));
	show_debug_message("");
	*/

} else { //If what is passed in is not a species
	show_error("Argument passed into instantiateCreature_Parent is not a creature, it is a " + object_get_name(species.object_index), true);
}
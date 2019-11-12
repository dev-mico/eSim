// @description Generate a new simulation and begin running it.
//@author Marcos Lacouture

randomize(); //This will randomize game maker's seed so that random generation will be different every time the game is run.

speciesAmount = round(global.initialSpeciesAmount * (global.worldSize/1500)); //Amount of species to create. Scales with world size.
initialDevelopment = global.initialDevelopmentAmount; //Initial development. This is the # of points to be distributed among the 5 attributes.

room_goto(SimulationRoom);

global.speciesList = ds_list_create(); //Creates a 'dslist,' which has all the functionality of a java ArrayList, Queue, and Stack combined.
//The "Species" object will be instantiated through createNewSpecies. This list will store the IDs of every instance of a species, which will
// allow the species' to be accessed through their ID.

for (var i = 0; i < speciesAmount; i++) { 
	createNewSpecies(initialDevelopment, global.initialDiet); 
}


//obj_SimulationRunHelper will distribute all the bushes to the map and initialize all creatures.
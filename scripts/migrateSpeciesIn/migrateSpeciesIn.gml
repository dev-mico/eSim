//THIS CODE IS CURRENTLY NOT FUNCTIONAL

//@description: This code will migrate an inactive species into the game world, as specified by the call.
//@author: Marcos Lacouture

//Precondition: migrateSpeciesIn() is called with two arguments: species (a reference to the species in the global speciesList) and amount (the number of creatures of this species that will be migrated in).
//Postcondition: The species, with the number specified, will move in from a random point on the outside of the map, giving the illusion that they "migrated" into the simulation area.

var species = argument[0]; //Species to migrate in
var amount = argument[1]; //Amount of that species that are migrating in


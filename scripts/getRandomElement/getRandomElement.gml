//@description Get a random element from an array.
//@author Marcos Lacouture

//Precondition: The script is called with an array as its parameter.
//Postcondition: Return a random element in the array.

randomize();

array = argument[0]

return (array[round(random(array_length_1d(array) - 0.5))]);
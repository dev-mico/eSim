/// @description obj_egg is an object that is instantiated as a means of creating a new creature.

show_debug_message("Egg created");

initialized = false;

species = pointer_null;
parent = pointer_null; //The parent that gives birth to it. 50% of the new creature's genetics will come from the parent.
scaleFactor = 1;

creatureBorn = false; //Once this is true, do not continue to create creatures

color = c_white; //default white

subimage = 0;
subimageCount = 10; //Amount of steps each subimage is displayed
defaultSubimageCount = 10;

alpha = 1; // I want the egg to fade away slowly, so this is the image alpha
fadeOutSteps = 10; //The amount of steps the egg shell takes to fade
holdSteps = 250; //The amount of steps to hold after the egg is broken

stepCountdown = 0; //stepCountdown is the amount of steps, counting down, for an egg to hatch. This is usually minimal, and the egg will hatch at the speed of the game world.

initialized = false; //initialized in alarm 0

drawFloatingText("New Birth!", x, y, c_aqua, 1.5, 1.5);

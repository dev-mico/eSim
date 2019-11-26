/// @description Creature object. This will be the overarching object for all the living creatures you'll see in the world.
//@author Marcos Lacouture
//Alarm 0 will initialize the creature, this is where all the "fields" are declared but not defined.

showPerceptionView = true; //Debug code: When set to true, every creature's view range will be displayed in a red box.

//All variables below are defined in instantiateCreature.

species = "";

creatureListReference = pointer_null; //Reference to the "creature" list in the species object.

scaleFactor = 0.75; //1 = 100% size, 0.9 is 90%. The sprites are generally too big, so 0.75 is considered a medium-sized creature, 0.5 is small-ish, 0.35 is small, 1 is big-ish, and anything above one is generally big.

dead = false;

sprite_body = 2;
sprite_head = 7;
sprite_arm = 1;
sprite_color = make_colour_rgb(255, 160, 100) 

creatureWidth = sprite_get_width(sprite_body);
creatureHeight = sprite_get_height(sprite_body);

diet = 0;
development = 0;
attack = 0;
dexerity = 0;
defense = 0;
perception = 0;
stamina = 0;
aggressivity = 0;

mutated = false;

actionsQueue = ds_list_create();

movementSpeed = 0;
facing = 1; //1 means facing right, -1 means facing left

creatureHealth = 0;
creatureMaxHealth = 0;

starvationSeconds = 1; //This is the amount of seconds that it takes for the creature's hunger to reduce by 1%, which will be scaled in code to adjust for the time scale.
starveCountingDown = false;

currentFood = 0; //Amount of food on the creature (if it were a dead corpse that could be eaten). This depends on the creature's size.

viewRange = 0;

maxHunger = 0; // Maximum hunger depends on size.
hunger = 0; // Current amount of hunger.
flashingRed = false;

initialized = false; //This is set to true in alarm[0], which is called after instantiateCreature finishes setting all of the creature's characteristics.
//Until initialized, the creature will have no behavior.



	
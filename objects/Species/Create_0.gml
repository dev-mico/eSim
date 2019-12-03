/// @description Species is the overarching data of a species, not the individual instances. It stores average characteristics such as the average attack, defense, etc.

avg_attack = 0;
avg_defense = 0;
avg_dexerity = 0;
avg_stamina = 0;
avg_perception = 0;
name = "";
avg_aggressivity = 0;
avg_development = 0;

avg_diet = 0; //-1 carnivore, 0 omnivore, 1 herbivore

avg_color = c_white; 

avg_sprite_head = 0;
avg_sprite_body = 0;
avg_sprite_arm = 0;


reproductionCountdownMax = 30000; //steps to count down before reproduction, maximum
reproductionCountdownMinimum = 5000; //minimum
reproductionCountdown = 0; //countdown between reproduction

creatures = ds_list_create(); //All instantiated creatures will be added to this list, so that the Species object can access individual creatures.

//All these variables above will be set by another script.
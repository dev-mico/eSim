/// @description This is a helper object to initially help the simulation get started up. The alarms here are useful, as GMS doesn't recognize room_goto until a few steps after.
//@author Marcos Lacouture

//Anything in the "Create" event will occur once the simulation is initially created.



global.foodBushList = ds_list_create(); //List of all food bushes, for findFood code.
global.corpseList = ds_list_create(); //List of all obj_creatures who are dead and can be eaten, for findFoodCarnivore code.

foodBushCount = 75 * (5/global.foodScarcity) * (global.worldSize/1500);
initialCreatureAmount = global.initialCreatureAmount * (global.worldSize/1500);

room_height = global.worldSize;
room_width = global.worldSize;

inst_PLAYERCAMERA.x = room_width/2;
inst_PLAYERCAMERA.y = room_height/2;

//Tile we want is 55.
groundLayer = layer_get_id("Ground");
ground_tilemap_grass = layer_tilemap_get_id(groundLayer);

tilemap_set_width(ground_tilemap_grass, room_width);
tilemap_set_height(ground_tilemap_grass, room_height);
show_debug_message(tilemap_get_width(ground_tilemap_grass));

for(var i = 0; i < tilemap_get_width(ground_tilemap_grass)/16; i++) { //This will generate the floor as green regardless of the room's size.
	for(var j = 0; j < tilemap_get_height(ground_tilemap_grass)/16; j++) {
		tilemap_set(ground_tilemap_grass, 55, i,j);
	}
}

camera_set_view_size(view_camera[0], room_width, room_height)

for (var i = 0; i < foodBushCount; i++) { //Distribute food bushes
	randomize();
	var X = random(room_width - sprite_get_width(Vegetation));
	var Y = random(room_height - sprite_get_height(Vegetation));
	
	while (!place_free(x,y)) {
		//If the bush intersects with other bushes or the edge of the room
		randomize();
		X = X = random(room_width - sprite_get_width(Vegetation));
		Y = random(room_height - sprite_get_height(Vegetation));
	}
	
	var newBush = instance_create_layer(X, Y, "FoodBushLayer", foodBush);	
	ds_list_add(global.foodBushList, newBush);
}




for (var i = 0; i < ds_list_size(global.speciesList); i++) { //Create the initial creatures. This must occur here.
	species = ds_list_find_value(global.speciesList, i);
	species.persistent = false; //Persistence must be made false now, as it was true earlier to circumvent an error.
	
	startX = random(room_width);
	startY = random(room_height);
	for (var j = 0; j < initialCreatureAmount; j++) {
		instantiateCreature(species, (startX + (30 * random_range(-1, 1))), (startY + (30 * random_range(-1, 1))) );
	}
}
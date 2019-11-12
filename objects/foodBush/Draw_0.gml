/// @description Draw the sprite differently depending on whether or not there's food

if (currentFood > 0) {
	draw_sprite(Vegetation, foodType + 1, x, y);
} else {
	if (regrowthCountdown <= 0) {
		regrowthCountdown = regrowthTime * room_speed/global.timeScale; //regrowthTime is in seconds, so convert it	
	}
	draw_sprite(Vegetation, 0, x, y); //draw the normal bush if there's no food	
}
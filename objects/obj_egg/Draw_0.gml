/// @description Insert description here
// You can write your code in this editor

if (initialized == true) { //Only draw the egg once its initialized
	if (is_undefined(species) == false) { //Failsafe: Fix a rare bug.
		draw_sprite_ext(eggSprite, subimage, x, y, scaleFactor, scaleFactor, 0, species.avg_color, alpha);
	}
}
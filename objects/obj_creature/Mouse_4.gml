/// @description Check if the creature is clicked. If it is, highlight it.

if (point_in_rectangle(mouse_x, mouse_y, x - creatureWidth/8, y - creatureHeight/8, x + creatureWidth/8, y + creatureHeight/8) == true) { //If the button is clicked
	global.highlightedCreature = id;
} 
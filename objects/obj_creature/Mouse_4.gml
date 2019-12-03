/// @description Check if the creature is clicked. If it is, highlight it.

if (point_in_rectangle(mouse_x, mouse_y, x - creatureWidth, y - creatureHeight, x + creatureWidth, y + creatureHeight) == true) { //If the button is clicked
	global.highlightedCreature = id;
} 
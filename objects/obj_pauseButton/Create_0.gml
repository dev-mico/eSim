/// @description Pause or play button, designed to denote whether or not the simulation is paused. This object takes care of all pausing and playing functions with time.
// @author Marcos Lacouture 



x2 = x + sprite_get_width(pauseButtonSprite);
y2 = y + sprite_get_height(pauseButtonSprite);

hovered = false;
highlighted = false;
global.paused = false;

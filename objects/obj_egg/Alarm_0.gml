/// @description Initialize the egg. This alarm inherits relevant characteristics from the parent and does all the calculations for the child before its instantiation.

stepCountdown = 250;

color_red = colour_get_red(parent.sprite_color);
color_red = (color_red + colour_get_red(species.avg_color))/2; //Get the average R,G,B values between the parent and the species for the egg.

color_blue = colour_get_blue(parent.sprite_color);
color_blue = (color_blue + (colour_get_blue(species.avg_color)))/2;

color_green = colour_get_green(parent.sprite_color);
color_green = (color_green + (colour_get_green(species.avg_color)))/2

color = make_colour_rgb(color_red, color_blue, color_green);

scaleFactor = parent.scaleFactor;

initialized = true;
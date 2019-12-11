//Whenever you are doing a draw event, use draw_sprite_ext, which will include an xscale and yscale

draw_set_font(font);

draw_set_halign(fa_left);



buttonscaleX = camera_get_view_width(view_camera[0])/1500;

buttonscaleY = camera_get_view_height(view_camera[0])/1500;



vx = camera_get_view_x(view_camera[0]);

vy = camera_get_view_y(view_camera[0]);



draw_sprite_ext(sprite, -1, vx, vy, buttonscaleX, buttonscaleY, 0, c_white, 0.75);



yStep = 15*buttonscaleY; // puts space between new lines of text



height = string_height(String[0]); // height of one string

totalHeight = height*array_length_1d(String); // total amount of space all lines of text take



/*if(totalHeight*buttonscaleY >= sprite_height*buttonscaleY - 15*buttonscaleY) {

	while (totalHeight*scaleY >= sprite_height*buttonscaleY - 15*buttonscaleY) { // while it is to big to fit the y parameter

			scaleY -= .01;

	}

} else if((totalHeight*buttonscaleY) <= sprite_height*buttonscaleY) {

	while ((totalHeight*scaleY) <= sprite_height*buttonscaleY && scaleY < 2) { // while it is to big to fit the y parameter

			scaleY += .01;

	}

}*/



for (var i = 0; i < array_length_1d(String); i+=1) { // for each string in the array
	if (String[i] != pointer_null) {
		scaleX = buttonscaleX; // resets scale for new line

		if(string_width(String[i])*buttonscaleX >= sprite_width*buttonscaleX - 32*buttonscaleX) {

			while(string_width(String[i])*scaleX >= sprite_width*buttonscaleX - 32*buttonscaleX) { // scaling the width of the text 

				scaleX -= .01;

			}

		}/* else if(string_width(String[i])*buttonscaleX <= sprite_width*buttonscaleX - 32*buttonscaleX) {
		
		
			while(string_width(String[i])*scaleX <= sprite_width*buttonscaleX - 32*buttonscaleX) { // scaling the width of the text 

				scaleX += .01;

			}

		}*/



		draw_text_ext_transformed_colour(vx + (18*buttonscaleX), vy + yStep, String[i], 10, -1, scaleX, buttonscaleY, 0,

			textColor[i], textColor[i], textColor[i], textColor[i], 1); // -1 is the width limit, this way it 

																// never reaches that limit

		yStep += height*buttonscaleY;
	}
}
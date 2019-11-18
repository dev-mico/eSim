//Whenever you are doing a draw event, use draw_sprite_ext, which will include an xscale and yscale
draw_sprite_ext(sprite, -1, x, y, 1, 1, 0, c_white, 1);
yStep = 0; // puts space between new lines of text
for (var i = 0; i < array_length_1d(String); i+=1) { // for each string in the array
	while(string_width(String[i])*scaleX >= sprite_width - 5) { // scaling the width of the text 
		scaleX -= .01;
	}
	draw_text_ext_transformed_colour(x+2, y + yStep, String[i], 10, sprite_width+500, scaleX, scaleY, 0, font_color, font_color, font_color, font_color, 1);
	yStep += 15;
	scaleX = 1; // resets scale for new line
}

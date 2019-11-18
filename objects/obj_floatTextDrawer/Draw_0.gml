if (initialized == true) {
	draw_set_font(font);
	draw_set_alpha(alpha);
	draw_set_color(text_color);
	draw_text_transformed(x + xAdjust, currentY, text, scaleX, scaleY, 0);
	draw_set_alpha(1);
}
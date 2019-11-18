// all this is for y scaling in case there is too many lines of text to fit
// just did this so i'm not sure if it works, add more strings to test it
count = 0;
for (var i = 0; i < array_length_1d(String); i+=1) { // get total number of strings
	count+=1;
}
totalHeigth = string_height(String[0])*count; // total amount of space each line of text takes up
while ((totalHeigth*scaleY) >= sprite_height-5) { // while it does not fit the y parameter
	scaleY -= .01;
}
//@description drawFloatingText will draw floating text depending on the arguments that are passed.
//Any arguments passed into the argument[] array are optional.
//@author Marcos Lacouture

//Precondition: drawFloatingText is called, with the arguments: (text, X, Y, color, depth, scaleX, scaleY).
//Postcondition: Create a floatTextDrawer at the X and Y with the specified parameters.


//The code below is simple, so I don't really comment much.
var text = argument0; 
var X = argument1;
var Y = argument2;
var color = argument3;
var Depth = argument4;
var scaleX = argument5;
var scaleY = argument6;

var font = fontFloatingText;

var textDrawer = instance_create_depth(X, Y, Depth, obj_floatTextDrawer);

textDrawer.text = text;
textDrawer.x = X;
textDrawer.y = Y;
textDrawer.text_color = color;
textDrawer.font = font;
textDrawer.scaleX = scaleX;
textDrawer.scaleY = scaleY;
textDrawer.initialized = true; //Initialize text drawer
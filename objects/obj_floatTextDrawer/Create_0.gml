/// @description This object is responsible for drawing floating text that fades away after a few steps (Think the little numbers that show up in an RPG that represent the amount of damage dealt)
//@author Marcos Lacouture

font = fontMainMenuSubheader;

origFadeInSteps = 40;
origHoldSteps = 5;
origFadeOutSteps = 80;

scaleX = 1;
scaleY = 1;

fadeInSteps = -1;
holdSteps = -1;
fadeOutSteps = -1;

yRange = 30; //Range of y-values that the text will go through. The text will fade in from half of this down, and fade out at half of this up.

text = "Test";
text_color = c_red;
alpha = 0;

initialized = true; // Set this to true when you create this in another script

yAdjust = 0;
xAdjust = 0;
currentY = y;

origViewportX = camera_get_view_x(view_camera[0]);
prevViewportY = camera_get_view_y(view_camera[0]); //Use this to fix scaling issues with camera zoom
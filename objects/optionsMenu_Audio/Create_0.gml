/* @author Marcos Lacouture
 * YoYo Games defines the Create event as:
 * This event happens when an instance of the object is first created, 
 * and is the very first thing that happens within an instance placed in the room 
 * through the room editor when a room is entered. This means that this event is the 
 * ideal place to initialize variables, start Timelines, set paths etc... and do anything else that generally only needs to be done once or only when an instance first appears in the room.
 */
 

menu_x = x;
menu_y = y;
button_h = 40; //Distance between buttons, in pixels

topOffset = 150; //Offset of buttons from the title screen

//button names. Slider: will create a slider with whatever text goes after it.
button[0] = "Slider:Music Volume";
button[1] = "Slider:Sound Effects Volume";
button[2] = "Return to Options";

buttonCount = array_length_1d(button); //How many items are in this menu

menuIndex = 0; // Which button is currently selected
lastSelected = 0;

slider_width = 40; //Width of the slider
slider_divisions = 10; //Amount of divisions in the slider
slider_x = x + (slider_width/2); //The slider's x offset, begins at the center of the slider
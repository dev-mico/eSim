/* @author Marcos Lacouture
 * YoYo Games defines the Create event as:
 * This event happens when an instance of the object is first created, 
 * and is the very first thing that happens within an instance placed in the room 
 * through the room editor when a room is entered. This means that this event is the 
 * ideal place to initialize variables, start Timelines, set paths etc... and do anything else that generally only needs to be done once or only when an instance first appears in the room.
 */
 
 ///  @description Create the button 'class' type thing

menu_x = x;
menu_y = y;
button_h = 64; //Distance between buttons, in pixels

topOffset = 100; //Distance from the title header, in pixels

//button names
button[0] = "Audio Options";
button[1] = "Simulation Options";
button[2] = "Display Options";
button[3] = "Return to Menu";

buttonCount = array_length_1d(button); //How many items are in this array, returns 3

menuIndex = 0; // Which button is currently selected
lastSelected = 0;


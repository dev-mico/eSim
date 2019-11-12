/* @author Marcos Lacouture
 * YoYo Games defines the Create event as:
 * This event happens when an instance of the object is first created, 
 * and is the very first thing that happens within an instance placed in the room 
 * through the room editor when a room is entered. This means that this event is the 
 * ideal place to initialize variables, start Timelines, set paths etc... and do anything else that generally only needs to be done once or only when an instance first appears in the room.
 */
 
 ///  @description Create the button 'class' type thing

display_set_gui_size(room_width,room_height);

menu_x = x;
menu_y = y;
button_h = 64; //Distance between buttons, in pixels


//button names
button[0] = "New Simulation";
button[1] = "Options";
button[2] = "Exit";

buttonCount = array_length_1d(button); //How many items are in this array, returns 3

menuIndex = 0; // Which button is currently selected
lastSelected = 0;

/* @author Marcos Lacouture
 * YoYo Games defines the Create event as:
 * This event happens when an instance of the object is first created, 
 * and is the very first thing that happens within an instance placed in the room 
 * through the room editor when a room is entered. This means that this event is the 
 * ideal place to initialize variables, start Timelines, set paths etc... and do anything else that generally only needs to be done once or only when an instance first appears in the room.
 */
 

menu_x = x;
menu_y = y;
button_h = 64; //Distance between buttons, in pixels

topOffset = 150; //Offset of buttons from the title screen

//button names. Slider: will create a slider with whatever text goes after it.
button[0] = "Resolution Options";
button[1] = "Window Options";
button[2] = "Return to Options";

buttonCount = array_length_1d(button); //How many items are in this menu

menuIndex = 0; // Which button is currently selected
lastSelected = 0;

activeMenu = "Display"; //This will be changed to resolution and window and display different things to avoid needing a new room and object.

resolutionButtons[0] = "Auto-detect";
resolutionButtons[1] = "Scroller:Set Manually";
resolutionButtons[2] = "Return to Display Options"; 

scrollerOpen = false;
scrollerSubimage = 0; //Which subimage to be (ex. left button is red, right button is red, or no buttons are red).

//Below, an array with a list of different common screen resolutions is instantiated.
resolutions[0] = "2048X1536";
resolutions[1] = "1920X1080";
resolutions[2] = "1366X768";
resolutions[3] = "1024X768";
resolutions[4] = "960X720";
resolutions[5] = "800X600";
resolutions[6] = "640X480";

currentResIndex = 0; //current index in the resolutions list. this is for navigation through the resolutions through the dropdown scroller menu.

// Below are all declarations relevant to windows
windowButtons[0] = "Scroller:Fullscreen";
windowButtons[1] = "Return to Display Options";	 
fullscreen = true;
/// @description The action object is an object that contains two things: an action, and its priority.
//@author Marcos Lacouture

action = ""; //Action name
priority = 0; //Higher numbers here signify a higher priority

arg1 = -1; //This is an argument. May or may not be needed for an action. An example of an action that needs an argumetn: moveTo action: arg1 is the X coordinate and arg2 is the Y-coordinate. 
arg2 = -1;
arg3 = -1;


//All fields will be set by whatever script creates the action. Actions are meant to be read-only and have no other methods or events.
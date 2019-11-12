//@description The moveTowards script will move an object towards a given point at the provided movement speed.
//@author Marcos Lacouture

//Precondition: moveTowards is called with an object ID as the first argument, followed by a movement speed and an X and Y coordinate to move towards. The coordinates must be within the room.
//Postcondition: Make the object take one 'step' towards the x and y coordinate, each 'step' being the size of movementSpeed. If the target X or target Y is outside of the room, throw an error with a description of the issue.
var toMove = argument[0];
var movementSpeed = argument[1];
var targetX = argument[2];
var targetY = argument[3];

//The code below makes sure that the creature being moved does not attempt to leave the game world.
if (targetX > room_width- toMove.creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
	//targetX = room_width - (toMove.creatureWidth/8);
	show_error("X Target would put creature outside of room: " + string(targetX) + ". Limit for X is " + string(room_width - (toMove.creatureWidth/8)), true); 
} else if (targetX < 0 + toMove.creatureWidth/8) {
	//targetX = toMove.creatureWidth/8;
	show_error("X Target would put creature outside of room: " + string(targetX) + ". Limit for X is " + string(toMove.creatureWidth/8), true); 
} else if (targetY > room_height - toMove.creatureHeight/8) {
	//targetY = room_height - toMove.creatureHeight/8;
	show_error("Y Target would put creature outside of room: " + string(targetY) + ". Limit for Y is " + string(room_height - toMove.creatureHeight/8), true); 
} else if (targetY < toMove.creatureHeight/8) {
	//targetY = 0 + (toMove.creatureHeight/8);	
	show_error("Y Target would put creature outside of room: " + string(targetY) + ". Limit for Y is " + string( (toMove.creatureHeight/8)), true); 
}

movementSpeed *= global.timeScale; //Scale all movement based on the timeScale.

var xDifference = toMove.x - targetX;
var yDifference = toMove.y - targetY;

if (xDifference != 0) {
	if (xDifference > 0) {
		toMove.facing = -1;
		if (movementSpeed > xDifference) { //Don't overshoot your target x.
			toMove.x = targetX;
		} else {
			toMove.x -= movementSpeed;	
		}
	} else {
		toMove.facing = 1;
		if (movementSpeed > (-1 * xDifference)) { //Again, avoid overshooting target
			toMove.x = targetX; 	
		} else {
			toMove.x += movementSpeed;	
		}
	}
}

if (yDifference != 0) {
	if (yDifference > 0) {
		if (movementSpeed > yDifference) { //Don't overshoot your target y.
			toMove.y = targetY;
		} else {
			toMove.y -= movementSpeed;	
		}
	} else {
		if (movementSpeed > (-1 * yDifference)) { //Again, avoid overshooting target
			toMove.y = targetY; 	
		} else {
			toMove.y += movementSpeed;	
		}
	}
}
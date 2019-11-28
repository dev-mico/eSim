//@description The moveTowards script will move an object towards a given point at the provided movement speed.
//@author Marcos Lacouture

//Precondition: moveTowards is called with an object ID as the first argument, followed by a movement speed and an X and Y coordinate to move towards. The coordinates must be within the room.
//Postcondition: Make the object take one 'step' towards the x and y coordinate, each 'step' being the size of movementSpeed. If the target X or target Y is outside of the room, throw an error with a description of the issue.
var toMove = argument[0];
var movementSpeed = argument[1];
var targetX = argument[2];
var targetY = argument[3];

//First, recalibrate the x and y targets to be away from the creature rather than towards it.
//Do this by reflecting the target x and y over the creature's x and y coordinates.
var diffX = targetX - toMove.x;
var diffY = targetY - toMove.y;

diffX *= -1; //Perform reflection
diffY *= -1;

if (diffX != 0) {
	while (abs(diffX) < movementSpeed) { //Make sure the creature runs and runs and runs with no end
		diffX *= 10; 
	}
}

if (diffY != 0) {
	while (abs(diffY) < movementSpeed) {
		diffY *= 10; 
	}
}

targetX = toMove.x + diffX;
targetY = toMove.y + diffY;

if (targetX == toMove.x) { //If the creature is running from something that is currently on it, run to a unique x coordinate
	targetX = sqr(id) * random_range(-1, 1);
}

if (targetY = toMove.y) {
	targetY = sqrt(id) * random_range(-1, 1);
}

//The code below makes sure that the creature being moved does not attempt to leave the game world.
if (targetX > room_width- toMove.creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
	targetX = room_width - (toMove.creatureWidth/8);
} else if (targetX < 0 + toMove.creatureWidth/8) {
	targetX = toMove.creatureWidth/8;
} else if (targetY > room_height - toMove.creatureHeight/8) {
	targetY = room_height - toMove.creatureHeight/8;
} else if (targetY < toMove.creatureHeight/8) {
	targetY = 0 + (toMove.creatureHeight/8);	
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
/// @description Draw the creature based on its characteristics
//@author Marcos Lacouture

/// @description Draw the creature based on its characteristics
//@author Marcos Lacouture



if (initialized == true) or (initialized == false) {
	var headOffsetX = 0;
	var headOffsetY = 0;
	var headScaleX = 1; //Some heads need to be rescaled to fit their bodies.
	var headScaleY = 1;

	var armOffsetX = 0;
	var armOffsetY = 0;
	var armScaleX = 1;
	var armScaleY = 1

	var localScaleFactor = scaleFactor;
	localScaleFactor *= facing; //Use a local scale factor so you can change direction if facing is -1.
	//Local scale factor will only be applied to any X-scaling, as you only want to flip the sprite horizontally.

	var localSpriteColor = sprite_color; //Use a local sprite color so that you can paint the creature as red when it is damaged.

	if (flashingRed == true) {
		localSpriteColor = c_red;
		if (!alarm[2]) {
			alarm[2] = 6; 	
		}
	}


	//Calculate offsets in these if statements below. All these values are manually calibrated so that each body part looks good. Don't worry about this code.


	if (sprite_body == 0) {  // Boar body
		sprite_arm = -1; //Failsafe: This body cannot have an arm as it is a quadripedal body.
			if (sprite_head == 0) { //Wolf head
				headOffsetX = 33;
				headOffsetY = -5;
			} else if (sprite_head == 1) { //Boar head
				headOffsetX = 32;
				headOffsetY = -5;
				headScaleX = 1;
				headScaleY = 0.75;
			} else if (sprite_head == 2) { //angry reptile head
				headOffsetX = 31;
				headOffsetY = 3;
				headScaleY = 1.2;
			} else if (sprite_head == 3) { //Bunny Head
				headScaleX = 1.15;
				headScaleY = 1.15;
				headOffsetX = 33;
				headOffsetY = -5;
			} else if (sprite_head == 4) { //T-rex head
				headOffsetX = 31;
				headOffsetY = 3;
				headScaleY = 1.1;
			} else if (sprite_head == 5) { // Deer head
				headScaleX = 1.2;
				headScaleY = 1.2;
				headOffsetX = 33;
				headOffsetY = -9;
			} else if (sprite_head == 6) { //Deer head (w/ antlers)
				headScaleX = 1.2;
				headScaleY = 1.2;
				headOffsetX = 33;
				headOffsetY = -13;
			} else if (sprite_head ==7) { //Duck head
				headScaleX = 1.2;
				headScaleY = 1.2;
				headOffsetX = 30;
				headOffsetY = -9;
			} else if (sprite_head == 8) {// rhino head
				headOffsetX = 32;
				headOffsetY = -5;
				headScaleX = 1.2;
				headScaleY = 0.85;
			}
	} else if (sprite_body == 1) { //Wolf body
		sprite_arm = -1; //Failsafe: This body cannot have an arm as it is a quadripedal body.
		if (sprite_head == 0) {
				headScaleY= 1.5;
				headOffsetX = 25;
				headOffsetY = -5;
			} else if (sprite_head == 1) {
				headOffsetX = 25;
				headOffsetY = 2;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 2) {
				headOffsetX = 20;
				headOffsetY = 0;
				headScaleY = 1.75;
				headScaleX = 1.5;
			} else if (sprite_head == 3) {
				headScaleY= 1.65;
				headScaleX = 1.15;
				headOffsetX = 25;
				headOffsetY = -5;
			} else if (sprite_head == 4) {
				headOffsetX = 24;
				headOffsetY = 0;
				headScaleY = 1.55;
				headScaleX = 1.5;
			} else if (sprite_head == 5) {
				headScaleY= 1.65;
				headScaleX = 1.80;
				headOffsetX = 25;
				headOffsetY = -5;
			} else if (sprite_head == 6) {
				headScaleY= 1.65;
				headScaleX = 1.80;
				headOffsetX = 25;
				headOffsetY = -9;
			} else if (sprite_head == 7) {
				headScaleY= 1.65;
				headScaleX = 1.5;
				headOffsetX = 28;
				headOffsetY = -10;
			} else if (sprite_head == 8) {
				headOffsetX = 28;
				headOffsetY = 0;
				headScaleX = 1.4;
				headScaleY = 1.2;
			}
	} else if (sprite_body == 2) { // T Rex Body
		if (sprite_head == 0) {
				headOffsetX = 5;
				headOffsetY = -22;
				headScaleX = 0.8;
				headScaleY = 0.9;
			} else if (sprite_head == 1) {
				headOffsetX = 9;
				headOffsetY = -25;
				headScaleX = 0.75;
				headScaleY = 0.6;
			} else if (sprite_head == 2) {
				headOffsetX = 6;
				headOffsetY = -25;
				headScaleX = 0.75;
				headScaleY = 1;
			} else if (sprite_head == 3) {
				headOffsetX = 7;
				headOffsetY = -28;
				headScaleX = 0.95;
				headScaleY = 1.25;
			} else if (sprite_head == 4) {
				headOffsetX = 8;
				headOffsetY = -20;
				headScaleX = 0.9;
			}  else if (sprite_head == 5) {
				headOffsetX = 6.5;
				headOffsetY = -28;
				headScaleX = 1.25;
				headScaleY = 1.1;
			} else if (sprite_head == 6) {
				headOffsetX = 6.5;
				headOffsetY = -32;
				headScaleX = 1.25;
				headScaleY = 1.1;
			} else if (sprite_head == 7) {
				headOffsetX = 6.5;
				headOffsetY = -26;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 8) {
				headOffsetX = 9;
				headOffsetY = -25;
				headScaleX = 0.75;
				headScaleY = 0.6;
			}
		
			//Second if statements for drawing arms below
			if (sprite_arm == 0) {
				armScaleX = 1;
				armScaleY = 1;
				armOffsetY = 3;
			}
	} else if (sprite_body == 3) { //spider body
		sprite_arm = -1;
		if (sprite_head == 0) {
			headOffsetX = 18;
			headOffsetY = 0;
			headScaleX = 1.2;
			headScaleY = 1.2;
		} else if (sprite_head == 1) {
			headOffsetX = 18;
			headOffsetY = 0;
			headScaleX = 1;
			headScaleY = 0.85;
		} else if (sprite_head == 2) {
			headOffsetX = 18;
			headOffsetY = 2;
			headScaleX = 1.4;
			headScaleY = 1.4;
		} else if (sprite_head == 3) {
			headOffsetX = 18;
			headOffsetY = 0;
			headScaleX = 1.35;
			headScaleY = 1.2;
		} else if (sprite_head == 4) {
			headOffsetX = 18;
			headOffsetY = 2;
			headScaleX = 1.4;
			headScaleY = 1.4;
		}  else if (sprite_head == 5) {
			headOffsetX = 18;
			headOffsetY = 0;
			headScaleX = 1.35;
			headScaleY = 1.25;
		} else if (sprite_head == 6) {
			headOffsetX = 18;
			headOffsetY = -6;
			headScaleX = 1.35;
			headScaleY = 1.25
		} else if (sprite_head == 7) {
			headOffsetX = 19;
			headOffsetY = -0.5;
			headScaleX = 1.45;
			headScaleY = 1.45;
		} else if (sprite_head == 8) {
			headOffsetX = 20;
			headOffsetY = 0;
			headScaleX = 1;
			headScaleY = 0.85;
		}
	} else if (sprite_body == 4) { //Camel body
		sprite_arm = -1; //Failsafe: This body cannot have an arm as it is a quadripedal body.
		if (sprite_head == 0) {
				headScaleY= 1.25;
				headScaleX = 1.25;
				headOffsetX = 25;
				headOffsetY = -8;
			} else if (sprite_head == 1) {
				headOffsetX = 28;
				headOffsetY = -4;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 2) {
				headOffsetX = 24;
				headOffsetY = -8;
				headScaleY = 1.25;
				headScaleX = 1.25;
			} else if (sprite_head == 3) {
				headScaleY= 1.35;
				headScaleX = 1;
				headOffsetX = 23;
				headOffsetY = -8;
			} else if (sprite_head == 4) {
				headOffsetX = 24;
				headOffsetY = -4;
				headScaleY = 1.35;
				headScaleX = 1.25;
			} else if (sprite_head == 5) {
				headScaleY= 1.35;
				headScaleX = 1.35;
				headOffsetX = 23;
				headOffsetY = -12;
			} else if (sprite_head == 6) {
				headScaleY= 1.35;
				headScaleX = 1.35;
				headOffsetX = 23;
				headOffsetY = -18;
			} else if (sprite_head == 7) {
				headScaleY= 1.4;
				headScaleX = 1.4;
				headOffsetX = 23;
				headOffsetY = -12;
			} else if (sprite_head == 8) {
				headOffsetX = 28;
				headOffsetY = -4;
				headScaleX = 1;
				headScaleY = 1;
			}
	} else if (sprite_body == 5) { //Camel body
		sprite_arm = -1; //Failsafe: This body cannot have an arm as it is a quadripedal body.
			if (sprite_head == 0) {
				headScaleY= 1.25;
				headScaleX = 1.25;
				headOffsetX = 25;
				headOffsetY = -18;
			} else if (sprite_head == 1) {
				headOffsetX = 28;
				headOffsetY = -4;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 2) {
				headOffsetX = 24;
				headOffsetY = -8;
				headScaleY = 1.25;
				headScaleX = 1.25;
			} else if (sprite_head == 3) {
				headScaleY= 1.35;
				headScaleX = 1.2;
				headOffsetX = 23;
				headOffsetY = -16;
			} else if (sprite_head == 4) {
				headOffsetX = 24;
				headOffsetY = -4;
				headScaleY = 1.35;
				headScaleX = 1.25;
			} else if (sprite_head == 5) {
				headScaleY= 1.35;
				headScaleX = 1.35;
				headOffsetX = 23;
				headOffsetY = -16;
			} else if (sprite_head == 6) {
				headScaleY= 1.35;
				headScaleX = 1.35;
				headOffsetX = 23;
				headOffsetY = -22;
			} else if (sprite_head == 7) {
				headScaleY= 1.35;
				headScaleX = 1.3;
				headOffsetX = 26;
				headOffsetY = -18;
			} else if (sprite_head == 8) {
				headOffsetX = 28;
				headOffsetY = -4;
				headScaleX = 1;
				headScaleY = 1;
			}
	} else if (sprite_body == 6) { //Snake body
		sprite_arm = -1;
		if (sprite_head == 0) {
				headOffsetX = 13;
				headOffsetY = -22;
				headScaleX = 0.8;
				headScaleY = 0.9;
			} else if (sprite_head == 1) {
				headOffsetX = 15;
				headOffsetY = -25;
				headScaleX = 0.75;
				headScaleY = 0.6;
			} else if (sprite_head == 2) {
				headOffsetX = 14;
				headOffsetY = -25;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 3) {
				headOffsetX = 15;
				headOffsetY = -28;
				headScaleX = 1.1;
				headScaleY = 1.25;
			} else if (sprite_head == 4) {
				headOffsetX = 16;
				headOffsetY = -20;
				headScaleX = 0.9;
			}  else if (sprite_head == 5) {
				headOffsetX = 14.5;
				headOffsetY = -28;
				headScaleX = 1.25;
				headScaleY = 1.1;
			} else if (sprite_head == 6) {
				headOffsetX = 14.5;
				headOffsetY = -28;
				headScaleX = 1.1;
				headScaleY = 0.9;
			} else if (sprite_head == 7) {
				headOffsetX = 14.5;
				headOffsetY = -26;
				headScaleX = 1;
				headScaleY = 1;
			} else if (sprite_head == 8) {
				headOffsetX = 16;
				headOffsetY = -25;
				headScaleX = 0.75;
				headScaleY = 0.6;
			}
	}

	//Next, scale everything.
	headOffsetX *= localScaleFactor;
	headOffsetY *= scaleFactor;


	//Finally, draw everything.

	if (dead == false) { //If the creature is alive you have to draw it differently than if its dead.
		
		if (drawClickBox == true) {
			draw_set_colour(c_teal);
			draw_rectangle(x - clickBoxSize, y - clickBoxSize, x + clickBoxSize, y + clickBoxSize, false);
			draw_set_colour(c_white);
		}
		
		if (global.highlightedCreature == id) { //If the creature is selected, draw the outline first.
			var outlineScaleFactor = 1.3; //local constant for readability
			draw_sprite_ext(bodySpriteOutline, sprite_body, x + xOffset, y, outlineScaleFactor * localScaleFactor, outlineScaleFactor * scaleFactor, 0, c_aqua, 1);
			draw_sprite_ext(headSpriteOutline, sprite_head, (x + (headOffsetX) +  xOffset), (y + (headOffsetY)), localScaleFactor * (headScaleX * outlineScaleFactor), scaleFactor * (headScaleY * outlineScaleFactor), 0, c_aqua, 1);
		}
		
		draw_sprite_ext(bodySprite, sprite_body, x + xOffset, y, localScaleFactor, scaleFactor, 0, localSpriteColor, 1);
		draw_sprite_ext(headSprite, sprite_head, (x +headOffsetX + xOffset), (y + headOffsetY), localScaleFactor * headScaleX, scaleFactor * headScaleY, 0, localSpriteColor, 1);

		if (sprite_arm != -1) {
			draw_sprite_ext(armSprite, sprite_arm, (x +armOffsetX + xOffset), (y + armOffsetY), localScaleFactor * armScaleX, scaleFactor * armScaleY, 0, localSpriteColor, 1);
		}

		if (showPerceptionView == true) {
			draw_set_colour(c_red);
			draw_rectangle(x - viewRange, y - viewRange, x + viewRange, y + viewRange,true);
			draw_set_colour(c_white);
		}
		
	} else {
		draw_sprite_ext(bodySprite, sprite_body, x, y, localScaleFactor, (scaleFactor*-1), 0, c_gray, 1);
		draw_sprite_ext(headSprite, sprite_head, (x +headOffsetX), (y - headOffsetY), localScaleFactor * headScaleX, (scaleFactor*-1) * headScaleY, 0, c_gray, 1);

		if (sprite_arm != -1) {
			draw_sprite_ext(armSprite, sprite_arm, (x +armOffsetX), (y - armOffsetY), localScaleFactor * armScaleX, (scaleFactor*-1) * armScaleY, 0, c_gray, 1);
		}
	}
}


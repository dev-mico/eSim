/// @description All creature behavior is coded here
//@author Marcos Lacouture


//Basic description: All creature behavior must occur through reading actions.
// There is an arraylist called 'actionsQueue' that contains all the current queued actions for the creature.
// An obj_action object has two fields: priority and action. Using the reoderActions script, you can reorder the actions in increasing priority.

// Whenever you complete an action, you MUST remember to delete the instance of the action in the game world. Otherwise, performance will decay over time due to a memory leak.

if (x < 0) or (x > room_width) or (y < 0) or (y > room_height) { //Failsafe: If a creature is for some reason leaving the room, just remove it.
	ds_list_delete(creatureListReference, ds_list_find_index(creatureListReference, id)); //Creature must be removed from the creature list as well. 
	instance_destroy(id);
}

if (initialized == true) and (global.paused == false) {
	if (creatureHealth > 0) { //Check if creature is alive
		if (creatureHealth < creatureMaxHealth) and (hunger > (maxHunger/100 * 60)){ //If the creature has above 60% hunger and the creature is hurt, heal the creature by 2% of its max health each step.
			if (!alarm[3]) {
				alarm[3] = room_speed*starvationSeconds/global.timeScale; //use the same values as the starvation speed, for balance
			}
		}
	
		if (attackCooldown > 0) {
			//1 means facing right, -1 means facing left
			if (facing == 1) {//1 means facing right, -1 means facing left
				
				if (attackCooldown > attackCooldownOrigSteps - 13) {
					xOffset += global.timeScale * scaleFactor;
					if (xOffset > 13 * scaleFactor) {
						xOffset = 13 * scaleFactor;	
					}
				} else if (attackCooldown > attackCooldownOrigSteps - 26) {
					xOffset -= global.timeScale * scaleFactor;
					if (xOffset < 0) {
						xOffset = 0;	
					}
				}
				
			} else {
				
				if (attackCooldown > attackCooldownOrigSteps - 13) {
					xOffset -= global.timeScale * scaleFactor;
					if (xOffset < -13 * scaleFactor) {
						xOffset = -13 * scaleFactor;	
					}
				} else if (attackCooldown > attackCooldownOrigSteps - 26) {
					xOffset += global.timeScale * scaleFactor;
					if (xOffset > 0) {
						xOffset = 0;	
					}
				}
				
			}
		}
		
		if (starveCountingDown == false) { //If the alarm for starvation is not currently counting down
			alarm[1] = room_speed*starvationSeconds/global.timeScale; //Multiply starvationSeconds by room_speed to convert from seconds to steps. Alarm 1 will count down starvationSeconds before depleting a little bit of the creature's hunger.
			starveCountingDown = true;
		}
		
		var highestPriorityAction = checkNeeds(id); //Check the next most urgent action for the creature
		var containsHighestAction = false;
		
		for (var i = 0; i < ds_list_size(actionsQueue); i++) { //Check if the highest priority action is in the action queue
			if (ds_list_find_value(actionsQueue, i).priority == highestPriorityAction.priority) {
				containsHighestAction = true;
			}
		}
		
		if (containsHighestAction == false) { //If the next most urgent action for the creature is not currently in the actions queue, add it to the actions queue
			ds_list_add(actionsQueue, highestPriorityAction);
		}
		
		actionsQueue = reorderActions(actionsQueue); //Must reorder the actions in order of descending priority before reading (and executing) the first action.
		var actionToUndergo = ds_list_find_value(actionsQueue, 0);
		
		if (is_undefined(actionToUndergo) == false) { //Failsafe 1: If the queue is empty (which would happen for a bizarre reason), then just skip over until its full.
		
			if (instance_exists(actionToUndergo)) { //Failsafe: Sometimes, the actionToUndergo would not be instantiated. If this is the case, remove it from the list, since it's not an actual object, it ust appeared (again, for a bizarre reason).
		
				if (actionToUndergo.action == "idle") {
					var newAction = instance_create_layer(0, 0, "InvisibleObjects", obj_action);
					newAction.priority = 1;
					newAction.action = "idleMoveTo"; //Create an Idle moveTo action. This is a low-priority action that makes the creature walk around a bit while its idle.
					var targetX = x + (random_range(-20, 20));
					var targetY = y + (random_range(-20, 20));
		
					if (targetX > room_width- creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
						targetX = room_width - (creatureWidth/8);
					} else if (targetX < 0 + creatureWidth/8) {
						targetX = creatureWidth/8;
					} else if (targetY > room_height - creatureHeight/8) {
						targetY = room_height - creatureHeight/8;
					} else if (targetY < creatureHeight/8) {
						targetY = 0 + (creatureHeight/8);	
					}
		
					newAction.arg1 = targetX;
					newAction.arg2 = targetY;
			
					ds_list_add(actionsQueue, newAction);
					ds_list_delete(actionsQueue, 0);
					instance_destroy(actionToUndergo);
				} else if (actionToUndergo.action == "idleMoveTo") {
					// In idleMoveTo, the first argument is the x coordinate to move to, and the second is the Y coordinate to move to.
					// idleMoveTo is low-priority, as its only purpose is to give the creatures some movement while they are idle
					// Author: Marcos Lacouture
					var targetX = actionToUndergo.arg1;
					var targetY = actionToUndergo.arg2;
			
					if (targetX > room_width- creatureWidth/8){  //If the creature is attempting to leave the game world, this recalibrates its targets to not allow it to.
						targetX = room_width - (creatureWidth/8);
						actionToUndergo.arg1 = targetX;
					} else if (targetX < 0 + creatureWidth/8) {
						targetX = creatureWidth/8;
						actionToUndergo.arg1 = targetX;
					} else if (targetY > room_height - creatureHeight/8) {
						targetY = room_height - creatureHeight/8;
						actionToUndergo.arg2 = targetY;
					} else if (targetY < creatureHeight/8) {
						targetY = 0 + (creatureHeight/8);	
						actionToUndergo.arg2 = targetY;
					}
			
					moveTowards(id, movementSpeed, targetX, targetY);
			
					var differenceX = x - targetX; //Differences must be used because there is an issue where comparing an integer (1) to the same integer as a double (1.00) will return false.
					var differenceY = y - targetY;	
			
					if (round(differenceX) == 0) and (round(differenceY) == 0) { //If you have reached the target X, add an "idleWait" with a random number of steps to wait.
							var newAction = instance_create_layer(0, 0, "InvisibleObjects", obj_action);
							newAction.priority = 1;
							newAction.action = "idleWait"; //Create an Idle moveTo action.
							newAction.arg1 = round(random(100)/global.timeScale); //Amount of steps to wait. This will be random.

							ds_list_add(actionsQueue, newAction);
							ds_list_delete(actionsQueue, 0);
							instance_destroy(actionToUndergo);
					}
			
				} else if (actionToUndergo.action == "idleWait") {
					//idleWait is a low-priority wait action. It will wait arg1 steps before creating another random idleMoveTo.
					//This action was designed so that you don't have creatures moving in random directions constantly while they are idle.
					//Author: Marcos Lacouture
			
					var stepsLeftToWait = actionToUndergo.arg1;
			
					if (stepsLeftToWait == 0) { //If you are done waiting, put 'idle' as the next action.
						ds_list_delete(actionsQueue, 0);
						instance_destroy(actionToUndergo);
					} else {
						actionToUndergo.arg1 -= 1;	
					}
			
				} else if (actionToUndergo.action == "findFood") {
					//findFood will find food within the creature's perceptive range, and queue an 'eat' action at the food found.
					//If no food is found, the findFood action will create a new 'findFoodMoveTo' action.
					foodFound = findFood(id, viewRange); //The ID of the food bush found
			
					if (foodFound == pointer_null) { //If no food was found
				
						var newAction = instance_create_depth(0, 0, 5000, obj_action);
						newAction.action = "findFoodMoveTo"; //findFoodMoveTo is a moveTo that occurs either until you get to a certain point, or you find food on the way.
						var searchRange = (300 * room_width/1500); //The lengths creatures will look continuously for food should depend on the room size.
				
						targetX = x + random_range(-1 * searchRange, searchRange);
						targetY = y + random_range(-1 * searchRange, searchRange);
					
						if (targetX > room_width- creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
							targetX = room_width - (creatureWidth/8);
						} else if (targetX < 0 + creatureWidth/8) {
							targetX = creatureWidth/8;
						} else if (targetY > room_height - creatureHeight/8) {
							targetY = room_height - creatureHeight/8;
						} else if (targetY < creatureHeight/8) {
							targetY = 0 + (creatureHeight/8);	
						}
					
						newAction.arg1 = targetX;
						newAction.arg2 = targetY;
				
						newAction.priority = actionToUndergo.priority; //Since there are findFood events of varying priorities, set this priority equal to the findFood action's priority.
						ds_list_add(actionsQueue, newAction);
				
					} else { //If you indeed did find food, then the coordinates will be stored as x = foodCoodinates[0] and y = foodCoordinates[1].
				
						var newAction = instance_create_depth(0, 0, 5000, obj_action);
						newAction.action = "eat";
						newAction.arg1 = foodFound;
						newAction.priority = actionToUndergo.priority; //Since there are findFood events of varying priorities, set this priority equal to the findFood action's priority.
						ds_list_add(actionsQueue, newAction);
		
					}
					ds_list_delete(actionsQueue, 0);
					instance_destroy(actionToUndergo);
				} else if (actionToUndergo.action == "findFoodMoveTo") {
					//findFoodMoveTo differs from moveTo in that it checks for food on the way to its targetX and targetY.
					// If food is found on the way, it aborts the current findFoodMoveTo and replaces it with an 'eat' action.
					// If no food is found on the way, it creates another 'findFoodMoveTo' action.
					var targetX = actionToUndergo.arg1;
					var targetY = actionToUndergo.arg2; 
			
					if (targetX > room_width- creatureWidth/8){  //If the creature is attempting to leave the game world, this recalibrates its targets to not allow it to.
						targetX = room_width - (creatureWidth/8);
						actionToUndergo.arg1 = targetX;
					} else if (targetX < 0 + creatureWidth/8) {
						targetX = creatureWidth/8;
						actionToUndergo.arg1 = targetX;
					} else if (targetY > room_height - creatureHeight/8) {
						targetY = room_height - creatureHeight/8;
						actionToUndergo.arg2 = targetY;
					} else if (targetY < creatureHeight/8) {
						targetY = 0 + (creatureHeight/8);	
						actionToUndergo.arg2 = targetY;
					}
			
					foodFound = findFood(id, viewRange);
					moveTowards(id, movementSpeed, targetX, targetY); 	
			
					if (foodFound != pointer_null) { //If the creature finds food on the way, abort the current action and create an eat action with the necessary arguments.
						var newAction = instance_create_depth(0, 0, 5000, obj_action);
				
						newAction.action = "eat";
						newAction.arg1 = foodFound;
						newAction.priority = actionToUndergo.priority;
						ds_list_add(actionsQueue, newAction);
						ds_list_delete(actionsQueue, 0);
						instance_destroy(actionToUndergo);

					} else if (floor(x) == floor(targetX)) and (floor(y) == floor(targetY)) { //If no food is found on the way and you reach the target coordinates, keep searching.
						var newAction = instance_create_depth(0, 0, 5000, obj_action);
						newAction.action = "findFoodMoveTo"; 
						var searchRange = (300 * room_width/1500); //The lengths creatures will look continuously for food should depend on the room size.
				
						targetX =  x + random_range(-1 * searchRange, searchRange);
						targetY = y + random_range(-1* searchRange, searchRange);
				
						if (targetX > room_width- creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
							targetX = room_width - (creatureWidth/8);
						} else if (targetX < 0 + creatureWidth/8) {
							targetX = creatureWidth/8;
						} else if (targetY > room_height - creatureHeight/8) {
							targetY = room_height - creatureHeight/8;
						} else if (targetY < creatureHeight/8) {
							targetY = 0 + (creatureHeight/8);	
						}
				
						newAction.arg1 = targetX;
						newAction.arg2 = targetY;
				
						newAction.priority = actionToUndergo.priority;
						ds_list_add(actionsQueue, newAction);
						ds_list_delete(actionsQueue, 0);
						instance_destroy(actionToUndergo);
				
					}
				} else if (actionToUndergo.action == "eat") {
					toEat = actionToUndergo.arg1;
			
					
					if (diet == 1) or (instance_exists(toEat) == true){
						var distanceFromToEat = sqrt(sqr(x - toEat.x) + sqr(y - toEat.y));
						
						if (distanceFromToEat <= viewRange) {
						
							if (x != toEat.x) or (y != toEat.y) {//Move towards your eating target
								moveTowards(id, movementSpeed, toEat.x, toEat.y);	
							} else {//If you are at your target, eat.
								var hungerToBeFilled = maxHunger - hunger; //How hungry the creature is
								
								if (toEat.object_index == foodBush.object_index) { 
								
									if (hungerToBeFilled > toEat.currentFood) { //If there is less food on the bush than how hungry the creature is
										hunger += toEat.currentFood;
										toEat.currentFood = 0;
									} else { //Otherwise, do this
										hunger += hungerToBeFilled;
										toEat.currentFood -= hungerToBeFilled;
									}
									
									ds_list_delete(actionsQueue, 0);
									instance_destroy(actionToUndergo); //After you eat, remove the 'eat' function.
									
								} else {
									
									if (toEat.dead == true) {
										
										if (hungerToBeFilled > toEat.currentFood) { //If there is less food on the corpse than how hungry the creature is
											hunger += toEat.currentFood;
											toEat.currentFood = 0;
										} else { //Otherwise, do this
											hunger += hungerToBeFilled;
											toEat.currentFood -= hungerToBeFilled;
										}
									
										ds_list_delete(actionsQueue, 0);
										instance_destroy(actionToUndergo); //After you eat, remove the 'eat' function.
									
									} else { //If the target isn't dead, attack it 
										
										attackCreature(id, toEat);
										
									}
									
								}
								
							}	
							
						} else { //If the food escaped you as an omnivore or carnivore, remove the "eat" action.
							ds_list_delete(actionsQueue, 0);
							instance_destroy(actionToUndergo); 
						}
		
					} else { //If the instance no longer exists or has escaped the creature's line of sight, delete the "eat" function.
						ds_list_delete(actionsQueue, 0);
						instance_destroy(actionToUndergo); 
					}
					
				} else if (actionToUndergo.action == "findFoodCarnivore") {
					var foodFound = findFoodCarnivore(id, viewRange);	
					var newAction = instance_create_depth(0, 0, 5000, obj_action);

					
					if (foodFound == pointer_null) { //If you found no food, create a findFoodMoveTo_C event (carnivore)
						show_debug_message("food found is a null pointer");
						/*
						newAction.action = "findFoodMoveTo_C"; 
						var searchRange = (300 * room_width/1500); //The lengths creatures will look continuously for food should depend on the room size.
				
						targetX =  x + random_range(-1 * searchRange, searchRange);
						targetY = y + random_range(-1* searchRange, searchRange);
				
						if (targetX > room_width- creatureWidth/8){  //If it is attempting to, it recalibrates its targets to not allow it to.
							targetX = room_width - (creatureWidth/8);
						} else if (targetX < 0 + creatureWidth/8) {
							targetX = creatureWidth/8;
						} else if (targetY > room_height - creatureHeight/8) {
							targetY = room_height - creatureHeight/8;
						} else if (targetY < creatureHeight/8) {
							targetY = 0 + (creatureHeight/8);	
						}
				
						newAction.arg1 = targetX;
						newAction.arg2 = targetY;
				
						newAction.priority = actionToUndergo.priority;
						ds_list_add(actionsQueue, newAction);
						ds_list_delete(actionsQueue, 0);
						instance_destroy(actionToUndergo);
						*/
						
					} else if (foodFound.dead == false) { //If you found living food, hunt it
						newAction.action = "eat";
						newAction.arg1 = foodFound;
						newAction.priority = actionToUndergo.priority; //Since there are findFood events of varying priorities, set this priority equal to the findFood action's priority.
						ds_list_add(actionsQueue, newAction);
					} else { //If you found a corpse, go to it and eat it.
						newAction.action = "eat";
						newAction.arg1 = foodFound;
						newAction.priority = actionToUndergo.priority; //Since there are findFood events of varying priorities, set this priority equal to the findFood action's priority.
						ds_list_add(actionsQueue, newAction);
					}
					
					ds_list_delete(actionsQueue, 0);
					instance_destroy(actionToUndergo);
					
				} else {
					show_error("Action '" + actionToUndergo.action + "' is not an action with behavior.", true);	
				}
		
			} 
		} 
		
		else { //Failsafe: Remove mis-generated action
			ds_list_delete(actionsQueue, ds_list_find_index(actionsQueue, actionToUndergo));	
		}
		
	} else if (dead == false) { //If the creature is dead, set dead to true. Remove the creature from the species' "creature" list, and add it to the global corpseList.
		ds_list_delete(creatureListReference, ds_list_find_index(creatureListReference, id)); //Delete the creature from the "species" list, since it's dead and its averages should no longer be taken account for in reproduction.
		ds_list_add(global.corpseList, id); 
		dead = true;
	} else {
		if (currentFood <= 0) { //Delete the creature from the game once it is dead and eaten.
			ds_list_delete(global.corpseList, ds_list_find_index(global.corpseList, id));	
			instance_destroy(id);
		}
	}
}

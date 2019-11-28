//Precondition: removeIdleActions is called with a single ds_list actions
//Postcondition: Any actions relating to idling (idle, idleMoveTo, and idleWait) will be cleared from the list.

actionsQueue = argument0;

var noIdles = false; //This will be set to true once there is no idle actions in the actions queue.

while (noIdles != true) { // Using a for loop may result in skipping of an item, as the arraylist's size is variable. Use a while loop to ensure nothing is missed.
	var idleFound = false;
	
	for (var i = 0; i < ds_list_size(actionsQueue); i++) { //Iterate through the list.
		var currentAction = ds_list_find_value(actionsQueue, i);
		
		if (currentAction.action == "idle") or (currentAction.action == "idleMoveTo") or (currentAction.action == "idleWait") {
			idleFound = true;
			ds_list_delete(actionsQueue, i);	
			instance_destroy(currentAction);
		}
	}
	
	if (idleFound == false) { //No idle events found through iterating through the loop; set 'noIdles' to true.
		noIdles = true;	
	}
}
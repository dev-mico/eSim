//@description Reorder a ds_list of action objects.
//@author Marcos Lacouture

//Precondition: The reorderActions() script is called, with a ds_list of actions as its sole parameter.
//Postcondition: The same ds_list of actions will be returned with its elements in order of decreasing priority.

toReorder = argument[0];

inOrder = false;

while (inOrder == false) { //Keep going until the list is in order.
	for (var i = 0; i < (ds_list_size(toReorder) - 1); i++) {
		var currentAction = ds_list_find_value(toReorder, i);
		var nextAction = ds_list_find_value( toReorder, i + 1);
		
		if (currentAction.priority < nextAction.priority) {
			var temp = nextAction;
			ds_list_replace(toReorder, i+1, currentAction);
			ds_list_replace(toReorder, i, temp);
		}
	}
	
	var inOrderCheck = true; //Temporary value. Will be set to false in the next loop if the actions aren't in order.
	
	for (var i = 0; i < (ds_list_size(toReorder) - 1); i++) { //If it isn't in order, this loop will tell the computer that.
		var currentAction = ds_list_find_value(toReorder, i);
		var nextAction = ds_list_find_value( toReorder, i + 1);
		if (currentAction.priority < nextAction.priority) {
			inOrderCheck = false;
		}
	}

	if (inOrderCheck == true) { //If it's in order, escape the loop. If not, repeat the operation again until it's in order.
		inOrder = true;
	}
}

return toReorder;
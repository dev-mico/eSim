//@description Return an array with the elements that two arrays have in common.
//@author Marcos Lacouture


//Precondition: Call elementsInCommonInt with two arrays of integers
//Postcondition: Return an array with the elements in common. If there are none, return -1.

arr1 = argument[0];
arr2 = argument[1];
elementsInCommon[0] = 0;
elementIndex = 0; // Tracks the index of the elements
isEmpty = true;

for (var i = 0; i < array_length_1d(arr1); i++) {
	for(var j = 0; j < array_length_1d(arr2); j++) {
		if (arr1[i] == arr2[j]) {
				elementsInCommon[elementIndex] = arr1[i];
				elementIndex++;
				isEmpty=false;
		}
	}
}

if (isEmpty == false) {
	return elementsInCommon;
} else {
	return -1;	
}
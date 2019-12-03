/// @description Insert description here


if (global.paused == false) {
	stepCountdown -= global.timeScale; //Count down the egg hatch

	if (stepCountdown <= 0) { //Count up the egg's subimage.

		if (subimage >= 3) {
			if (creatureBorn == false) {
				//text, x, y, color, scaleX, scaleY
				instantiateCreature_Parent(species, x, y, parent); //create creature
				creatureBorn = true; //Avoid creating more than 1 creature per egg
			}
		
			if (holdSteps <= 0) { //Wait a while before despawning the egg shell.
				alpha -= (1/fadeOutSteps * global.timeScale);
				if (alpha <= 0) {
					instance_destroy(id);	
				}
			} else {
				holdSteps -= global.timeScale;	
			}
		} else {
			subimageCount -= global.timeScale;
			if (subimageCount <= 0) {
				subimage++;
				if (subimage > 3) {
					subimage = 3;	
				}
				subimageCount = defaultSubimageCount;
			}
		}
	}
}
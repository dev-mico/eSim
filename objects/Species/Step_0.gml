/// @description Reproduction is managed here

if (ds_list_size(creatures) > 0) { //If the species isn't extinct
	if (global.paused == false) {
		if (reproductionCountdown > 0) { //Count down to the next reproduction
			reproductionCountdown -= global.timeScale;
		} else {
			reproduce(id);
			reproductionCountdown = irandom_range(reproductionCountdownMinimum, reproductionCountdownMax);
		}
	}
}
/// @description Handle increases in time.

if (keyboard_check_pressed(period)) {
	playSound(1);
	if (global.timeScale < 48) {
		sprite +=1;
		if (global.timeScale < 6) {
			global.timeScale += 1;	
		} else {
			global.timeScale *= 2;	
		}
	} 
}
if (keyboard_check_pressed(comma)) {
	playSound(1);
	if (global.timeScale > 1) {
		sprite -=1;
		if (global.timeScale <= 6) {
			global.timeScale -= 1;	
		} else {
			global.timeScale /= 2;	
		}
	}
}
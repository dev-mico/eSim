/// @description Alarm 1 is responsible for depleting the creature's hunger. Called in the step method, this event occurs every starvationSeconds (as defined in the create method).

if ((hunger - (maxHunger/100)) > 0) {
	hunger -= (maxHunger/100); //Deplete 1% of this creature's max hunger every time this event occurs
} else { //If subtracting hunger will result in a negative value, take the value from the health rather than the hunger.
	hunger = 0;
	dealDamage(id, (creatureMaxHealth/100), true); //Deal 1% of the creature's health in damage
}

starveCountingDown = false;
/*@description dealDamage() is a script that deals a set amount of damage to a creature and displays red fading text with the damage.
@author Marcos Lacouture
Precondition: The dealDamage() script is called with the parameters (id, damage, type), where id is the reference to the creature object being damaged
and damage is the damage to be dealt. hungerDamage is a boolean, which represents if the creature is taking damage from hunger or from another creature.
Postcondition: The damage to be dealt is subtracted from the creature's health, and red (or orange, if the damage is from hunger) floating text indicating the damage is shown. The creature will briefly flash red as well.
*/

creature = argument[0];
var damage = argument[1];
var hungerDamage = argument[2];

creature.creatureHealth -= damage;
if (hungerDamage == true) { //If the creature is taking damage from hunger, draw orange text.
	drawFloatingText(string(damage), creature.x, creature.y, c_orange, 1, 1);
} else {
	drawFloatingText(string(damage), creature.x, creature.y, c_red, 1, 1);
}
creature.flashingRed = true; //Make the creature flash red.
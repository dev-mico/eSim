//Precondition: The attack() script is called with two creatures as the parameters: The attacker and the attacked.
//Postcondition: the attacker's attack animation will play, and the attacked will take damage accordingly. Damage will vary with each hit

var attacker = argument[0];
var attacked = argument[1];

var attackCooldown = attacker.attackCooldown;
var origAttackCooldown = attacker.attackCooldownOrigSteps;

if (attackCooldown <= 0) { //Attack and then create a new cooldown.
	var damageDone = attacker.attack;

	damageDone *= random_range(80, 120)/100; //Not every attack should deal the same amount of damage. Give it a little bit of randomization.

	dealDamage(attacked, damageDone, false);
	
	//Damage is dealt; next, create a new cooldown.
	
	origAttackCooldown = attacker.attackCooldownSteps;
	origAttackCooldown *= random_range(70, 130)/100; //+- 30% (randomize cooldown slightly
	attacker.attackCooldownOrigSteps = origAttackCooldown;
	attacker.attackCooldown = origAttackCooldown;
} else {
	
	attacker.attackCooldown -= global.timeScale;	
	
}
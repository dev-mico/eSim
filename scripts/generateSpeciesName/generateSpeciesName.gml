//@description when called, this script will return a randomly generated species, from the arrays of suffixes specified here.
//@author Marcos Lacouture

// All prefixes declared below
prefixes[0] = "Archo";
prefixes[1] = "Archus";
prefixes[2] = "Arthro";
prefixes[3] = "Aspido";
prefixes[4] = "Brachi";
prefixes[5] = "Bronto";
prefixes[6] = "Cetio";
prefixes[7] = "Cyclo";
prefixes[8] = "Cyn";
prefixes[9] = "Diplo";
prefixes[10] = "Dromaeo";
prefixes[11] = "Eu";
prefixes[12] = "Giga";
prefixes[13] = "Giganto";
prefixes[14] = "Hemi";
prefixes[15] = "Hippus";
prefixes[16] = "Macro";
prefixes[17] = "Mega";
prefixes[18] = "Mimo";
prefixes[19] = "Para";
prefixes[20] = "Pachy";

// All suffixes declared below
suffixes[0] = "cantho";
suffixes[1] = "aspis";
suffixes[2] = "ceratus";
suffixes[3] = "cheirus";
suffixes[4] = "dendrum";
suffixes[5] = "don";
suffixes[6] = "erpeton";
suffixes[7] = "felis";
suffixes[8] = "formes";
suffixes[9] = "gnathus";
suffixes[10] = "ia";
suffixes[11] = "lophus";
suffixes[12] = "mimus";
suffixes[13] = "monas";
suffixes[14] = "odes";
suffixes[15] = "pus";
suffixes[16] = "psitta";
suffixes[17] = "rhinus";
suffixes[18] = "saurus";
suffixes[19] = "smilus";
suffixes[20] = "stomus";

prefix1 = prefixes[random_range(0, array_length_1d(prefixes))];
prefix2 = prefixes[random_range(0, array_length_1d(prefixes))];

while (prefix2 == prefix1) { //Make sure the prefixes aren't the same
	prefix2 = prefixes[random_range(0, array_length_1d(prefixes))];	
}

suffix1 = suffixes[random_range(0, array_length_1d(suffixes))];
suffix2 = suffixes[random_range(0, array_length_1d(suffixes))];

while (suffix2 == suffix1) {
	suffix2 = suffixes[random_range(0, array_length_1d(suffixes))];
}

speciesName = prefix1 + suffix1 + " " + prefix2 + suffix2;

return speciesName;
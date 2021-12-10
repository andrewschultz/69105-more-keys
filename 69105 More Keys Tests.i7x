Version 1/181229 of 69105 Tests by Andrew Schultz begins here.

"Tests for 69105 More Keys--mostly spoilery stuff"

volume tests - not for release

chapter shuffleing

shuffleing is an action out of world.

understand the command "shuffle" as something new.

understand "shuffle" as shuffleing.

carry out shuffleing:
	reshuffle-a;
	reshuffle-bc;
	the rule succeeds;

chapter cheating

cheating is an action out of world.

understand the command "cheat" as something new.

understand "cheat" as cheating.

carry out cheating:
	say "Right adjective stream:";
	repeat with Q running through relevant keystrucs:
		repeat through klist of Q:
			if weight entry is 1, say " [descrip entry]";
	say ".";
	if player is in room 69105a:
		say "Extra-bad key combo is";
		repeat with Q running through relevant keystrucs:
			let K be klist of Q;
			let R be badnum of Q;
			choose row R in K;
			say " [descrip entry]";
	say ".";
	the rule succeeds;

69105 Tests ends here.

---- DOCUMENTATION ----

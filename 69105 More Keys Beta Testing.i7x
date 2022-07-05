Version 1/220705 of 69105 More Keys Beta Testing by Andrew Schultz begins here.

"This has a few testing stubs for beta-testing 69105 More Keys."

volume beta testing - not for release

when play begins:
	say "Thanks for testing this![paragraph break][i][bracket]BETA TESTING NOTE: the command [b]SOLVE[r][i] gives you the solution if you want to undo things, and the command [b]CHEAT[r][i] tells you what the solution is. This isn't just a straight-up cheat, as it can also give you ideas of odd things to try, if you wish.[close bracket][r]";

chapter cheating

cheating is an action out of world.

understand the command "cheat" as something new.

understand "cheat" as cheating.

carry out cheating:
	if player is in room 50196, say "You don't need to cheat here." instead;
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

chapter solveing

solveing is an action applying to nothing.

understand the command "solve" as something new.

understand "solve" as solveing.

carry out solveing:
	if player is in room 50196, say "You can't solve the entry room." instead;
	if cur-guesses is 0:
		say "Adjusting current number of move guesses from 0 to 1.";
		now cur-guesses is 1;
	say "Solution:";
	repeat with KS running through relevant keystrucs:
		let T be klist of KS;
		repeat through T:
			if weight entry is 1, say " [descrip entry]";
	say ".";
	send-them-back;
	the rule succeeds.

69105 More Keys Beta Testing ends here.

---- DOCUMENTATION ----

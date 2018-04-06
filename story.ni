"69105 More Keys" by Andrew Schultz

volume initialization and variables

debug-state is a truth state that varies.

a keystruc is a kind of thing. a keystruc has a table name called klist. a keystruc has a number called goodnum. a keystruc has a number called badnum. a keystruc can be aroom or broom. a keystruc is usually aroom.

book room a

table of kwidths
descrip	weight
"thick"	1
"narrow"	1

widths is a keystruc. klist of widths is table of kwidths.

table of klengths
descrip	weight
"huge"	1
"long"	1
"medium"	1
"short"	1

lengths is a keystruc. klist of lengths is table of klengths.

table of kbrands
descrip	weight
"eagle"	1
"falcon"	1
"swordfish"	1
"octopus"	1
"dragon"	1
"troll"	1

brands is a keystruc. klist of brands is table of kbrands.

table of kfaces
descrip	weight
"smiley"	1
"frowny"	1
"sneery"	1
"shouty"	1
"confused"	1
"annoyed"	1
"puckered"	1

faces is a keystruc. klist of faces is table of kfaces.

table of khandles
descrip	weight
"hexagonal"	1
"octagonal"	1
"rhomboid"	1
"trapezoid"	1
"circular"	1
"pentagonal"	1
"heptagonal"	1
"zigzag"	1
"starred"	1
"arrowed"	1
"bubbly"	1
"clovery"	1

handles is a keystruc. klist of handles is table of khandles.

found-yet is a truth state that varies.
all-bad-so-far is a truth state that varies. [this determines if there are 32 extra keys of the "totally wrong" type]

book room b

room 69105b is a room.

[room b works as follows: there are actually 69105 keys. But they are broken down and weighted so that you have 3*5*17*271 total keys. You can see by the sum of the weights what goes where. There's some ambiguity with the 1/2 and 1/5/9/45, but other than that, you can guess what is going on pretty quickly. I think.]

table of kgrooves
descrip	weight
"double"	1
"single"	2

grooves is a keystruc. klist of grooves is table of kgrooves. grooves is broom.

table of ktextures
descrip	weight
"rough"	1
"smooth"	2
"bumpy"	2

textures is a keystruc. klist of textures is table of ktextures. textures is broom.

table of kwriting
descrip	weight
"numbered"	1
"brandname"	3
"generic"	5
"plain"	8

writing is a keystruc. klist of writing is table of kwriting. writing is broom.

table of kpatterns
descrip	weight
"camo"	1
"argyle"	9
"pinstripe"	13
"gingham"	17
"tattersall"	21
"tartan"	25
"herringbone"	29
"houndstooth"	33
"paisley"	37
"floral"	41
"dotted"	45

patterns is a keystruc. klist of patterns is table of kpatterns. patterns is broom.

volume main part

to mult-keys (KS - a keystruc):
	let j be the number of rows in klist of KS;
	say "Looking at [KS].";
	now j is (2 * j) - 1;
	let cur-row be 0;
	repeat through klist of KS:
		increment cur-row;
		if the player's command matches the regular expression "\b[descrip entry]\b":
			if cur-row is goodnum of KS:
				if debug-state is true, say "Right.";
				now all-bad-so-far is false;
				the rule succeeds;
			else:
				if debug-state is true, say "Wrong.";
				if cur-row is not badnum of KS:
					now all-bad-so-far is false;
				one-thou 2;
				the rule succeeds;
	one-thou j;

to say keynum:
	say "[if thousands > 0][thousands],[end if]";
	if thousands > 0:
		say "[if ones < 100]0[end if][if ones < 10]0[end if]";
	say "[ones]";

to one-thou (x - a number):
	now ones is ones * x;
	now thousands is thousands * x;
	increase thousands by (ones / 1000);
	now ones is the remainder after dividing ones by 1000;

ones is a number that varies. thousands is a number that varies. [ohai zmachine limitations]

definition: a keystruc (called myks) is relevant:
	if player is in 69105a and myks is aroom, decide yes;
	if player is in 69105b and myks is aroom, decide yes;
	decide no;

after reading a command:
	now ones is 1;
	now thousands is 0;
	now found-yet is false;
	now all-bad-so-far is true;
	repeat with KS running through relevant keystrucs:
		mult-keys KS;
	if all-bad-so-far is true:
		increase ones by 36;
		if ones > 1000:
			increment thousands;
			now ones is ones - 1000;
	say "[keynum] left based on your guess.";
[			if found-yet is true:
				say "You have two contradictory descriptions.";
				reject the player's command;
			now found-yet is true;]

when play begins:
	reshuffle-a;
	reshuffle-b;

to reshuffle-b:
	repeat with X running through broom keystrucs:
		table-num-shuf klist of X;

to table-num-shuf (thistab - a table name):
	let temp be number of rows in thistab;
	let temp2 be 0;
	let temp3 be 0;
	repeat with Q running from 1 to temp: [fisher yates shuffle on only the weight values]
		let Q2 be a random number between Q and temp;
		if Q2 is not Q:
			choose row Q2 in thistab;
			now temp2 is weight entry;
			choose row Q in thistab;
			now temp3 is weight entry;
			choose row Q2 in thistab;
			now weight entry is temp2;
			choose row Q in thistab;
			now weight entry is temp3;

to reshuffle-a:
	repeat with X running through aroom keystrucs:
		let Y be the number of rows in klist of X;
		now goodnum of X is a random number between 1 and Y;
		now badnum of X is goodnum of X + a random number between 1 and Y - 1;
		if badnum of X > Y:
			decrease badnum of X by Y;

to reshuffle-b:
	repeat with X running through broom keystrucs:
		let Y be the number of rows in klist of X;
		now goodnum of X is a random number between 1 and Y;
		now badnum of X is goodnum of X + a random number between 1 and Y - 1;
		if badnum of X > Y:
			decrease badnum of X by Y;

room 69105a is a room.

the key is a thing in room 69105a.

volume debug - not for release

when play begins:
	now debug-state is true;

chapter shuffleing

shuffleing is an action out of world.

understand the command "shuffle" as something new.

understand "shuffle" as shuffleing.

carry out shuffleing:
	reshuffle-a;
	reshuffle-b;
	the rule succeeds;

chapter cheating

cheating is an action out of world.

understand the command "cheat" as something new.

understand "cheat" as cheating.

carry out cheating:
	repeat with Q running through keystrucs:
		let B be the goodnum of Q;
		let C be the badnum of Q;
		say "[klist of Q]: right ([goodnum of Q])=";
		choose row B in klist of Q;
		say "[descrip entry] wrong ([badnum of Q])=";
		choose row C in klist of Q;
		say "[descrip entry].";
	the rule succeeds;

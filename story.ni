"69105 More Keys" by Andrew Schultz

volume initialization and variables

the story headline is "A Riff on David Welbourn's original game".

the story description is "For New Year Comp 2019".

the release number is 1.

include Trivial Niceties Z-Only by Andrew Schultz.

include Basic Screen Effects by Emily Short.

[below can be commented/uncommented as needed to perform tests.]
include 69105 Tests by Andrew Schultz.

debug-state is a truth state that varies.

a keystruc is a kind of thing. a keystruc has a table name called klist. a keystruc has a number called badnum. a keystruc can be aroom or broom. a keystruc is usually aroom.

to decide which number is totwt of (k - a keystruc):
	let temp be 0;
	if k is aroom, decide on (2 * (number of rows in klist of k)) - 1;
	repeat through klist of k:
		increase temp by weight entry;
	decide on temp;

door 69105 is scenery. "It's just a door. One of the 69,105 keys fits it."

instead of doing something with door 69105:
	if current action is examining, continue the action;
	say "You need to discover which key fits the door instead.";

book room 50196

Room 50196 is a room. "You are in room 50196. Scratched below you see 69105A and an arrow pointing northeast and 69105B and an arrow pointing northwest."

check going nowhere in Room 50196: say "There are really only two ways to go: northeast and northwest." instead;

check going nowhere: say "You aren't going anywhere until you find the right key." instead;

check going northeast in Room 50196:
	say "You hear a whirring behind you as the passage back closes.";
	key-move 69105a instead;

to key-move (r - a room):
	move the key to r;
	move door 69105 to r;
	move the player to r;

check going northwest in Room 50196:
	say "You hear a whirring behind you as the passage back closes.";
	key-move 69105b instead;

after looking in room 50196 for the first time:
	say "[bracket]First and most importantly, thanks to David Welbourn for his original game that gave me the idea to make a more mathy variant. And for his permisssion to make this sequel. Also, Type ABOUT to see general advice, or VERBS to see what sort of verbs to use.[close bracket][paragraph break]";

book room 69105a

Room 69105a is a room.

the key is a thing in Room 69105a. understand "keys" as key. description is "[key-desc]". "69,105 keys are littered all across the floor here. You can examine them all, or choose attributes to try to track down the ones that might fit the door."

to say key-desc:
	let first-item be false;
	say "There are 69105 total keys here. You need to find the right attribute in each group:[paragraph break]";
	repeat with Q running through relevant keystrucs:
		now first-item is true;
		repeat through klist of Q:
			say "[if first-item is true]* [Q] are [else], [end if]";
			now first-item is false;
			say "[descrip entry]";
		say "[line break]";
	the rule succeeds;

chapter randomized tables for room 69105a

table of kwidths
descrip	weight
"thick"	1
"narrow"	2

widths is a keystruc. klist of widths is table of kwidths.

table of klengths
descrip	weight
"huge"	1
"long"	2
"medium"	2
"short"	2

lengths is a keystruc. klist of lengths is table of klengths.

table of kbrands
descrip	weight
"eagle"	1
"falcon"	2
"swordfish"	2
"octopus"	2
"dragon"	2
"troll"	2

brands is a keystruc. klist of brands is table of kbrands.

table of kfaces
descrip	weight
"smiley"	1
"frowny"	2
"sneery"	2
"shouty"	2
"confused"	2
"annoyed"	2
"puckered"	2

faces is a keystruc. klist of faces is table of kfaces.

table of khandles
descrip	weight
"hexagonal"	1
"octagonal"	2
"rhomboid"	2
"trapezoid"	2
"circular"	2
"pentagonal"	2
"heptagonal"	2
"zigzag"	2
"starred"	2
"arrowed"	2
"bubbly"	2
"clovery"	2

handles is a keystruc. klist of handles is table of khandles.

guessed-any is a truth state that varies.
contradictory-guess is a truth state that varies.
all-bad-so-far is a truth state that varies. [this determines if there are 32 extra keys of the "totally wrong" type]

book room 69105b

Room 69105b is a room.

[room b works as follows: there are actually 69105 keys. But they are broken down and weighted so that you have 3*5*17*271 total keys. You can see by the sum of the weights what goes where. There's some ambiguity with the 1/2 and 1/5/9/45, but other than that, you can guess what is going on pretty quickly. I think.]

chapter random tables for room 69105b

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

table of kfonts
descrip	weight
"Cambria"	1
"Helvetica"	3
"Arial"	5
"Calibri"	8

fonts is a keystruc. klist of fonts is table of kfonts. fonts is broom.

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
	let myk be klist of ks;
	let tt be totwt of ks;
	let j be the number of rows in myk;
	say "(DEBUG) Looking at [KS].";
	now j is (2 * j) - 3;
	let cur-row be 0;
	let got-this-time be false;
	let guesses-in-table be 0;
	repeat through myk:
		increment cur-row;
		if the player's command matches the regular expression "\b[descrip entry]\b", case insensitively:
			increment guesses-in-table;
			say "Got [guesses-in-table] match for [descrip entry].";
			if guesses-in-table is 2:
				now contradictory-guess is true;
				the rule succeeds;
			now got-this-time is true;
			if weight entry is 1:
				now guessed-any is true;
				if debug-state is true, say "(DEBUG) [descrip entry] is right.";
				now all-bad-so-far is false;
			else:
				if debug-state is true, say "(DEBUG) [descrip entry] is wrong.";
				now guessed-any is true;
				if cur-row is not badnum of KS:
					now all-bad-so-far is false;
			one-thou weight entry;
	if got-this-time is false:
		one-thou tt;

to say keynum:
	say "[if thousands > 0][thousands],[end if]";
	if thousands > 0:
		say "[if ones < 100]0[end if][if ones < 10]0[end if]";
	say "[ones]";

to one-thou (x - a number):
	if debug-state is true, say "(DEBUG) Multiplying by [x].";
	now ones is ones * x;
	now thousands is thousands * x;
	increase thousands by (ones / 1000);
	now ones is the remainder after dividing ones by 1000;

ones is a number that varies. thousands is a number that varies. [ohai zmachine limitations]

definition: a keystruc (called myks) is relevant:
	if player is in 69105a and myks is aroom, decide yes;
	if player is in 69105b and myks is broom, decide yes;
	decide no;

cur-moves is a number that varies.
bad-keys-found is a number that varies.
bad-keys-this-time is a truth state that varies.

after reading a command:
	if player is in room 50196, continue the action;
	now ones is 1;
	now thousands is 0;
	now all-bad-so-far is true;
	if word number 1 in the player's command is "x" or word number 1 in the player's command is "take" or word number 1 in the player's command is "get":
		now guessed-any is false;
		now contradictory-guess is false;
		repeat with KS running through relevant keystrucs:
			mult-keys KS;
		if contradictory-guess is true:
			say "You have two contradictory descriptions.";
			reject the player's command;
		if all-bad-so-far is true and player is in 69105a:
			increase ones by 36;
			if ones > 1000:
				increment thousands;
				now ones is ones - 1000;
			if ones is 68 and bad-keys-this-time is false:
				now bad-keys-this-time is true;
				say "You found the random 'worst' set of keys available! This is sort of a hidden easter egg.";
				increment bad-keys-found;
		if guessed-any is false, continue the action;
		increment cur-moves;
		if thousands < 69:
			if thousands > 0 or ones > 1:
				say "You see [keynum] such keys that fit the description.";
				reject the player's command;
			say "You found the right key in [cur-moves] move[plur of cur-moves]! As you turn the key in the lock, you take a secret passage that winds around to...";
			send-them-back;
			reject the player's command;

to send-them-back:
	let LP be location of player;
	move player to Room 50196;
	increment wins of LP;
	increase moves of LP by cur-moves;
	if min-best of LP is 0 or min-best of LP > cur-moves:
		if min-best of LP > 0:
			say "You have a new best: [cur-moves] guesses, beating out [min-best of LP].";
			now min-best of LP is cur-moves;
		else:
			say "Congratulations on figuring things out for [LP] for the first time.";
			now min-best of LP is cur-moves;
	if cur-moves > 15, now cur-moves is 15;
	increment entry cur-moves of room-freq of LP;
	random-reset;

when play begins:
	now right hand status line is "[if player is in room 50196]NE or NW[else if cur-moves > 15]15+[else][gessiz][end if]";
	random-reset;

to random-reset:
	reshuffle-a;
	reshuffle-b;
	now cur-moves is 0;

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
			now weight entry is temp3;
			choose row Q in thistab;
			now weight entry is temp2;

to reshuffle-a:
	repeat with X running through aroom keystrucs:
		let K be klist of X;
		table-num-shuf K;
		let Q be a random number between 1 and number of rows in K;
		choose row Q in K;
		if weight entry is 1:
			let Q2 be a random number between 1 and (number of rows in K) - 1;
			if Q2 >= Q, increment Q2;
			now Q is Q2;
		now badnum of X is Q;

to reshuffle-b:
	repeat with X running through broom keystrucs:
		table-num-shuf klist of X;

volume odd verbs

chapter xyzzying

xyzzying is an action applying to nothing.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

carry out xyzzying:
	say "[if player is in room 50196]You don't need any desperate measures, yet[else]You wonder if jiggling the wrong key back and forth in the lock could open it. Then you regret not searching for a suitable PICK ANY LOCK videos on Youtube. Nope, you're going to have to use guesswork here. Maybe when you get home, it'll be something to sit and learn. It might even be easier than all this exhausting logical deduction[end if].";
	the rule succeeds.

chapter abouting

abouting is an action applying to nothing.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "This game is based on David Welbourn's original 69105 keys, which I had fun with, and which you should play. He mentioned it was a coding exercise for him (you can search for the code online--69105.inf,) but it seemed like it might be tricky in Inform 7.[paragraph break]Challenge accepted! But I didn't want to copy his puzzle mechanics, and I didn't come close to replicating all the neat jokes he put in his game. And I wondered. Was there any way I could make 69105 more symmetrical? It turns out that 69105 factors a few ways, and it's also close to a number that factors conveniently.[paragraph break]I had it in my head for a while, and it seemed like the perfect sort of game to submit to the Spring Thing back garden, which I did in 2019.[paragraph break]Perhaps it would be a good coding exercise for Twine, too, or even Python or Perl. For Twine, you could click on your next guess, and the number of keys left would appear. For Python/Perl, you could construct a stripped down parser. Writing (relatively) simple math/logic games like this could be good to learn new languages. You can also see who helped with this game with CREDITS.";
	say "[line break]I plan to put the source code online at bitbucket, for those who may find it useful.";
	if bad-keys-found is 0, say "[line break]By the way, you can try to find the absolute worst key for fun in [score-desc of room 69105a].";
	the rule succeeds;

chapter creditsing

creditsing is an action applying to nothing.

understand the command "credits" as something new.

understand "credits" as creditsing.

carry out creditsing:
	say "Thanks to (list of testers here). Thanks to Aaron Reed for hosting Spring Thing 2019 as well as previous iterations. Thanks to you for playing.";
	the rule succeeds.

chapter verbsing

verbsing is an action applying to nothing.

understand the command "verbs" as something new.

understand "verbs" as verbsing.

carry out verbsing:
	say "SCORE gives the score. Otherwise, you can sling together adjectives, and the command parser will scoop them all up and see which work. For instance, X PINK KEY will have the same effect as TAKE PINK or even PINK.";
	the rule succeeds.

volume parser errors

rule for printing a parser error:
	if player is in room 50196 and the player's command includes "arrow":
		say "The arrows are just there to give directions. You don't need to do anything with them." instead;
	say "There's nothing much to do here. You don't need any fancy verbs[if player is not in room 50196], just adjectives, mostly, to get the right key[end if]. You can [if player is in room 50196]go northwest or northeast[else]X (adjectives) KEYS until you get the right one[end if].";

volume tallying results

book records

a room has a number called wins. wins of a room is usually 0.
a room has a number called moves. moves of a room is usually 0.
a room has a number called min-best. min-best of a room is usually 0.
a room has a list of numbers called room-freq. room-freq of a room is usually {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}.

book requesting the score

check requesting the score:
	if player is in Room 50196:
		say "You need to move northwest or northeast to try one of the rooms.";
	else:
		say "You have made [gessiz] in [location of player]. In other words, you've examined [cur-moves] specific group[plur of cur-moves] of keys this time in the room.";
	show-wins 69105a;
	if bad-keys-found > 0, say "You also found [bad-keys-found] bad keys in [score-desc of 69105a].";
	show-wins 69105b;
	the rule succeeds;

to say gessiz:
	say "[cur-moves] guess[unless cur-moves is 1]es[end if]"

to say score-desc of (rm - a room):
	say "[if player is in rm]this room[else][rm][end if]";

to show-wins (rm - a room):
	if wins of rm is 0:
		say "You don't have any wins [if player is in rm]here[else]in [rm][end if] yet.";
	else:
		say "You have [wins of rm] win[plur of wins of rm] in [score-desc of rm], with [moves of rm] total move[plur of moves of rm], where [min-best of rm] is your best effort.";
		say "Here is a list of frequencies for turns taken to solve [rm]: ";
		let rmf be room-freq of rm;
		let space-yet be false;
		repeat with count running from 1 to number of entries in rmf:
			if entry count of rmf is 0, next;
			if space-yet is true, say ", ";
			now space-yet is true;
			say "[count][if count is number of entries in rmf]+[end if] tr[if count is 1]y[else]ies[end if] [entry count of rmf] time[plur of entry count of rmf]";
		say ".";

volume beta testing - not for release

chapter solveing

solveing is an action applying to nothing.

understand the command "solve" as something new.

understand "solve" as solveing.

carry out solveing:
	if player is in room 50196, say "You can't solve the entry room." instead;
	if cur-moves is 0:
		say "Adjusting current number of move guesses to 1.";
		now cur-moves is 1;
	say "Solution:";
	repeat with KS running through relevant keystrucs:
		let T be klist of KS;
		repeat through T:
			if weight entry is 1, say " [descrip entry]";
	say ".";
	send-them-back;
	the rule succeeds.

volume debug - not for release

when play begins:
	now debug-state is true;


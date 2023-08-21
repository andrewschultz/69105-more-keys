"69105 More Keys" by Andrew Schultz

volume initialization and variables

the story headline is "A Riff on David Welbourn's original game".

the story description is "For Spring Thing 2019".

the release number is 2.

Release along with the "Parchment" interpreter.

Release along with a website.

include Trivial Niceties by Andrew Schultz.

Include Old School Verb Total Carnage by Andrew Schultz.

include Basic Screen Effects by Emily Short.

include Conditional Undo by Jesse McGrew.

to decide which number is deadflag:
	(- deadflag -)

Rule for deciding whether to allow undo:
	if deadflag is 3:
		allow undo;
	if player is in room 50196:
		say "You have nothing you need to do here, much less undo it.";
	else:
		say "Undoing would allow you to artificially deflate your guess count too easily, so I'm disabling it. While you can save and retry, and so forth, that requires more effort than a short game like this needs. (Cue adult from your childhood scolding 'You're only cheating yourself, young man/lady!') Besides, there's nothing special for an extra-quick guess. [this-game] is all about figuring a strategy, then moving on once you're done.";
	deny undo;

description of the player is "[if player is in room 50196]As ready for logic puzzles as ever[else]There are no mirrors, but you suspect you look slightly disappointed you haven't found the right key to open the door to get out. Yet[end if]."

does the player mean examining the player when location of player is not room 50196: it is unlikely.

does the player mean doing something with the player: it is likely.

debug-state is a truth state that varies.

show-mult is a truth state that varies.

a keystruc is a kind of thing. a keystruc has a table name called klist. a keystruc has a number called badnum. a keystruc can be aroom, broom, bcroom or croom. a keystruc is usually aroom. a keystruc has a number called this-turn. a keystruc has indexed text called previous-found.

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

To set the/-- pronoun it to (O - an object): (- LanguagePronouns-->3 = {O}; -).

section beta testing - not for release

include 69105 More Keys Beta Testing by Andrew Schultz.

book room 50196

Room 50196 is a room. "You are in room 50196. Scratched on the floor you see an arrow with heads branching [if room-c-available]north, [end if]northeast and northwest.  Text ahead of the arrows indicates [b]69105A[r] is northeast [if room-c-available],[else]and[end if] [b]69105B[r] is northwest[if room-c-available], and [b]69105C[r] is north[end if][if can-exit][one of][or].[paragraph break]The passage south beckons out, it seems, unless you wish to hone your key-guessing skills[stopping][end if]."

check going south in room 50196 when can-exit:
	say "You take the path away from the three doors. Along the way you find a bag of money with your name on it. You count it, and there's ... why, there's TWO thousand dollars in there! A note inside, however, notes you can only keep it on one condition: a wolf, a goat and a cabbage will appear ahead, and you will need to take them across a river to safety. The boat can only carry one of them.[paragraph break]Well, for $2000, that bit of drudgery's a no-brainer.[paragraph break]Oh, by the way, you can UNDO if you wish to solve the puzzles of the keys more or hone your technique.";
	end the story;

check going nowhere in Room 50196: say "There are really only [if can-exit]four[else if room-c-available]three[else]two[end if] ways to go: [if can-exit]south, [end if][if room-c-available]north, [end if]northeast and northwest." instead;

check going nowhere: say "You aren't going anywhere until you find the right key." instead;

check going northeast in Room 50196:
	say "You hear a whirring behind you as the passage back closes.";
	key-move 69105a instead;

guess-list is a list of indexed text variable.

to key-move (r - a room):
	now guess-list is {};
	move the keys to r;
	move door 69105 to r;
	move the player to r;

check going northwest in Room 50196:
	say "You hear a whirring behind you as the passage back closes.";
	key-move 69105b instead;

to decide whether (rm - a room) is won:
	if wins of rm > 0, yes;
	no;

to decide whether room-c-available:
	if 69105b is won and 69105a is won, yes;;
	no;

to decide whether can-exit:
	if room-c-available and 69105c is won, yes;
	no;

check going north in Room 50196 when room-c-available:
	say "You hear a whirring behind you as the passage back closes.";
	key-move 69105c instead;

after looking in room 50196 for the first time:
	say "[i][bracket]First, and most importantly, thanks to David Welbourn for his original game that gave me the idea to make a math-wonky variant with ... a bit less backstory. And for his permisssion to make this sequel. Also, type [b]ABOUT[r][i] to see general advice, or [b]VERBS[r][i] to see what sort of verbs to use.[close bracket][r][paragraph break]";

chapter winning

check going south in room 50196 when can-exit:
	say "You take the path away from the three doors. Along the way you find a bag of money with your name on it. You count it, and there's ... why, there's TWO thousand dollars in there! The organizers guessed anyone who got sick of Towers of Hanoi might look ofor a bigger challenge. A note inside, however, notes you can only keep it on one condition: a wolf, a goat and a cabbage will appear ahead, and you will need to take them across a river to safety. The boat can only carry one of them.[paragraph break]Well, for $2000, that bit of drudgery's a no-brainer.[paragraph break]Of course, you can UNDO if you wish to solve the puzzles of the keys more or hone your technique.";
	end the story;

The print final score rule is not listed in for printing the player's obituary.

book room 69105a

Room 69105a is a room.

the keys are a plural-named thing in Room 69105a. description is "[key-desc]". "69,105 keys are littered all across the floor here. You can examine them all, or choose attributes to try to track down the ones that might fit the door.". understand "key" as keys.

after doing something with keys:
	set the pronoun it to keys;
	continue the action;

to say key-desc:
	let cur-row be 1;
	say "There are 69105 total keys here. Each has [number of relevant keystrucs in words] different defining attributes:[line break]";
	repeat with Q running through relevant keystrucs:
		say "[line break]";
		now cur-row is 1;
		repeat through klist of Q:
			if cur-row is 1:
				say "* ";
				say "[Q]" in upper case;
				say " can be ";
			else if cur-row is number of rows in klist of Q:
				say " or ";
			else:
				say ", ";
			increment cur-row;
			say "[if gyet entry is true][bold type][end if][descrip entry][roman type]";
		say ".[no line break]";
	say "[paragraph break]But which combination of the [number of relevant keystrucs in words] attributes will give you the unique key that will open the door?[no line break]";
	the rule succeeds;

bold-hint-yet is a truth state that varies.

after examining keys:
	if bold-hint-yet is false and cur-guesses > 0:
		say "NOTE: text in bold means something you've already guessed.";
		now bold-hint-yet is true;
	continue the action;

chapter randomized tables for room 69105a

table of kwidths
descrip	abbrev	weight	gyet	disamb
"narrow"	"nar"	1	False	text
"thick"	"thi"	2	--	--

widths is a keystruc. klist of widths is table of kwidths.

table of klengths
descrip	abbrev	weight	gyet	disamb
"huge"	"hug"	1	False	--
"long"	"lon"	2	--	--
"medium"	"med"	2	--	--
"short"	"shor"	2	--	"sho"

lengths is a keystruc. klist of lengths is table of klengths.

table of kbrands
descrip	abbrev	weight	gyet	disamb
"dragon"	"dra"	1	False	--
"eagle"	"eag"	2	--	--
"falcon"	"fal"	2	--	--
"octopus"	"octo"	2	--	"oct"
"swordfish"	"swo"	2	--	--
"troll"	"tro"	2	--	--

brands is a keystruc. klist of brands is table of kbrands.

table of kfaces
descrip	abbrev	weight	gyet	disamb
"annoyed"	"ann"	1	False	--
"confused"	"con"	2	--	--
"frowny"	"fro"	2	--	--
"puckered"	"puc"	2	--	--
"shouty"	"shou"	2	--	"sho"
"smiley"	"smi"	2	--	--
"sneery"	"sne"	2	--	--

faces is a keystruc. klist of faces is table of kfaces.

table of khandles
descrip	abbrev	weight	gyet	disamb
"arrowed"	"arr"	1	False	--
"bubbly"	"bub"	2	--	--
"circular"	"cir"	2	--	--
"clovery"	"clo"	2	--	--
"heptagonal"	"hep"	2	--	--
"hexagonal"	"hex"	2	--	--
"octagonal"	"octa"	2	--	"oct"
"pentagonal"	"pen"	2	--	--
"rhomboid"	"rho"	2	--	--
"starred"	"sta"	2	--	--
"trapezoid"	"tra"	2	--	--
"zigzag"	"zig"	2	--	--

handles is a keystruc. klist of handles is table of khandles.

guessed-any is a truth state that varies.
contradictory-guess is a truth state that varies.
all-bad-so-far is a truth state that varies. [this determines if there are 32 extra keys of the "totally wrong" type]

book room 69105b

Room 69105b is a room.

[room b works as follows: there are actually 69105 keys. But they are broken down and weighted so that you have 3*5*17*271 total keys. You can see by the sum of the weights what goes where. There's some ambiguity with the 1/2 and 1/5/9/45, but other than that, you can guess what is going on pretty quickly. I think.]

chapter randomized tables for room 69105b

table of kgrooves
descrip	abbrev	weight	gyet
"double"	"dou"	1	False
"single"	"sin"	2	--

grooves is a keystruc. klist of grooves is table of kgrooves. grooves is bcroom.

table of ktextures
descrip	abbrev	weight	gyet
"bumpy"	"bum"	1	False
"rough"	"rou"	2	--
"smooth"	"smo"	2	--

textures is a keystruc. klist of textures is table of ktextures. textures is bcroom.

table of kfonts
descrip	abbrev	weight	gyet
"arial"	"ari"	1	False
"calibri"	"cal"	3	--
"cambria"	"cam"	5	--
"tahoma"	"tah"	8	--

fonts is a keystruc. klist of fonts is table of kfonts. fonts is bcroom.

table of kshafts
descrip	abbrev	weight	gyet
"conical"	"con"	1	False
"cylindrical"	"cyl"	57	--
"helical"	"hel"	64	--
"prismatic"	"pri"	71	--
"spheroidal"	"sph"	78	--

shafts is a keystruc. klist of shafts is table of kshafts. shafts is broom.

book 69105c

Room 69105c is a room.

[room c works as follows: just like room b, only with room b, you have 11 weights instead of 5 for the final choice, so 1) there may be more accidents and 2) you may stumble over odd prime factors.]

table of kpatterns
descrip	abbrev	weight	gyet
"argyle"	"arg"	1	False
"camo"	"cam"	9	--
"dotted"	"dot"	13	--
"floral"	"flo"	17	--
"gingham"	"gin"	21	--
"herringbone"	"her"	25	--
"houndstooth"	"hou"	29	--
"paisley"	"pai"	33	--
"pinstripe"	"pin"	37	--
"tartan"	"tar"	41	--
"tattersall"	"tat"	45	--

patterns is a keystruc. klist of patterns is table of kpatterns. patterns is croom.

book ambiguities

table of ambiguities
abbrev	loc	abbrev-expand	revisit	t1	t2
"oct"	69105a	"octa(gonal) or octo(pus)"	false	brands	handles
"sho"	69105a	"shor(t) or shou(ty)"	false	faces	lengths

volume main part

to mult-keys (KS - a keystruc) and (T - indexed text):
	let myk be klist of ks;
	if debug-state is true, say "(DEBUG) Looking at [KS] and [T].";
	let cur-row be 0;
	let got-this-time be false;
	let guesses-in-table be 0;
	repeat through myk:
		increment cur-row;
		if disambiguating is false: [e.g. DOU DOUB DOUBL DOUBLE]
			unless "[descrip entry]" matches the regular expression "\b[T]", case insensitively and T matches the regular expression "\b[abbrev entry]", case insensitively:
				next;
		else:
			unless there is a disamb entry and T is "[disamb entry]":
				next;
		increment guesses-in-table;
		now gyet entry is true;
		if debug-state is true, say "(Debug) Got [guesses-in-table] match for [descrip entry].";
		increment this-turn of KS;
		if this-turn of KS is 2:
			now contradictory-guess is true;
			say "You combined two mutually-exclusive attributes: [descrip entry] duplicates [previous-found of ks].";
			the rule succeeds;
		now previous-found of KS is "[descrip entry]";
		now got-this-time is true;
		now full-description is "[full-description] [descrip entry]";
		if weight entry is 1:
			now guessed-any is true;
			if debug-state is true, say "(DEBUG) [descrip entry] is right.";
			now all-bad-so-far is false;
		else:
			if debug-state is true, say "(DEBUG) [descrip entry] is wrong.";
			now guessed-any is true;
			if cur-row is not badnum of KS:
				now all-bad-so-far is false;
		overflow-mult weight entry;

to say keynum:
	let thousands be hundreds divided by 10;
	let lastthree be ones + (100 * (the remainder after dividing hundreds by 10));
	say "[if thousands > 0][thousands],[end if]";
	if hundreds > 0:
		say "[if lastthree < 100]0[end if][if lastthree < 10]0[end if]";
	say "[lastthree]";

to overflow-mult (x - a number):
	let x-ones be the remainder after dividing x by 100;
	let x-hundreds be x divided by 100;
	let new-ones be x-ones * ones;
	let new-hundreds be x-hundreds * hundreds * 100;
	[say "multiplying [hundreds][if ones < 10]0[end if][ones] by overflow [x].";]
	[say "[hundreds]/[ones] * [x-hundreds]/[x-ones].";]
	increase new-hundreds by ones * x-hundreds;
	increase new-hundreds by hundreds * x-ones;
	now hundreds is new-hundreds;
	now ones is new-ones;
	if ones >= 100:
		increase hundreds by ones / 100;
		now ones is the remainder after dividing ones by 100;
	if debug-state is true and show-mult is true:
		say "(DEBUG) Multiplying by [x]. [hundreds], [ones]. Now at [keynum].";

ones is a number that varies. hundreds is a number that varies. [ohai zmachine limitations]

definition: a keystruc (called myks) is relevant:
	if player is in 69105a:
		if myks is aroom, decide yes;
	else if myks is bcroom:
		decide yes;
	else if player is in 69105b and myks is broom:
		decide yes;
	else if player is in 69105c and myks is croom:
		decide yes;
	decide no;

cur-guesses is a number that varies.
bad-keys-found is a number that varies.
bad-keys-this-time is a truth state that varies.

disambiguating is a truth state that varies.

full-description is indexed text that varies.
useless-words is indexed text that varies.

after reading a command (this is the detect adjectives rule):
	let this-useful be false;
	now full-description is "";
	now useless-words is "";
	if player is in room 50196, continue the action;
	now ones is 1;
	now hundreds is 0;
	now all-bad-so-far is true;
	now guessed-any is false;
	now contradictory-guess is false;
	now disambiguating is false; [should already be the case, but I'd rather be sure]
	if the player's command matches the regular expression "<^a-z >":
		say "There is no need for anything other than letters and spaces. Since I'm not sure where word breaks should be filtered, I'll just let you use the up-arrow to fix the command, if you typed one by mistake.";
		reject the player's command;
	repeat with KS running through relevant keystrucs:
		now this-turn of KS is 0;
		now previous-found of KS is "(unknown)";
	[start the actual code here]
	repeat through table of ambiguities:
		now revisit entry is false;
	repeat with X running from 1 to the number of words in the player's command:
		now this-useful is false;
		let Y be word number X in the player's command;
		repeat through table of ambiguities:
			if location of player is not loc entry, next;
			if Y is abbrev entry:
				if debug-state is true, say "(DEBUG) Revisit for disambiguation.";
				now revisit entry is true;
				now this-useful is true;
		repeat with KS running through relevant keystrucs:
			mult-keys KS and Y;
			if this-turn of KS > 1:
				reject the player's command;
			if this-turn of KS is 1, now this-useful is true;
		if this-useful is false:
			if Y is "the" or Y is "and" or Y is "a" or Y is "an" or Y is "x" or Y is "examine" or Y is "get" or Y is "take":
				next;
			now useless-words is "[useless-words] [Y]";
	repeat through table of ambiguities:
		if revisit entry is true:
			let pre1 be this-turn of t1 entry;
			let pre2 be this-turn of t2 entry;
			if pre1 is pre2:
				say "I wasn't able to resolve the ambiguity of [b][abbrev entry][r] to [abbrev-expand entry] because [t1 entry] and [t2 entry] were both [if pre1 > 0]already taken[else]unassigned[end if].";
				reject the player's command;
			now disambiguating is true;
			if pre1 > 0:
				mult-keys t2 entry and abbrev entry;
			else:
				mult-keys t1 entry and abbrev entry;
			now this-useful is true;
			now disambiguating is false;
	repeat with KS running through relevant keystrucs:
		if this-turn of KS is 0:
			overflow-mult totwt of KS;
	if contradictory-guess is true:
		say "You have two contradictory descriptions.";
		reject the player's command;
	if all-bad-so-far is true and player is in 69105a:
		increase ones by 36;
		if ones > 100:
			increment hundreds;
			now ones is ones - 100;
		if ones is 68 and bad-keys-this-time is false:
			now bad-keys-this-time is true;
			say "You found the random 'worst' set of keys available! Congratulations! Whether you found them by accident or on purpose, this is sort of a hidden easter egg.";
			increment bad-keys-found;
	if guessed-any is false, continue the action;
	if hundreds < 0:
		say "Oops. Overflow error. This is bad. But it is probably rectified by more detailed guesses.";
		add-unduplicated-guess;
		reject the player's command;
	if hundreds < 700:
		if useless-words is not "":
			say "List of words I skipped while parsing:[useless-words].";
		if hundreds > 0 or ones > 1:
			say "You see [keynum][full-description] keys. To see all adjectives, just type X.";
			add-unduplicated-guess;
			reject the player's command;
		increment cur-guesses;
		win-the-thing;
		reject the player's command;

to add-unduplicated-guess:
	let X be "[full-description] gave [keynum] keys.[line break]";
	if X is listed in guess-list:
		say "This is a duplicate guess, so I won't count it towards your total.";
	else:
		add X to guess-list;
		increment cur-guesses;

to win-the-thing:
	say "You found the right key in [cur-guesses] move[plur of cur-guesses]! As you turn the key in the lock, you take a secret passage that winds around to...";
	send-them-back;
	reject the player's command;

to send-them-back:
	deepen the status line to 1 rows;
	let LP be location of player;
	first-status;
	move player to Room 50196;
	increment wins of LP;
	increase moves of LP by cur-guesses;
	if min-best of LP is 0 or min-best of LP > cur-guesses:
		if min-best of LP > 0:
			say "You have a new best: [cur-guesses] guesses, beating out [min-best of LP].";
			now min-best of LP is cur-guesses;
		else:
			say "A disembodied voice chirps 'Congratulations on figuring things out for [LP] for the first time!'";
			now min-best of LP is cur-guesses;
			if LP is Room 69105c:
				say "[line break]You hear a grinding, and another passage opens to the south. You see light far away. Maybe it's a way out!";
	if cur-guesses > 15, now cur-guesses is 15;
	if cur-guesses < 1, now cur-guesses is 1;
	increment entry cur-guesses of room-freq of LP;
	random-reset;
	if LP is not room 69105c and wins of LP is 1 and room-c-available:
		say "[line break]You hear a grinding.  A third door appears in the north wall. It seems to lead to, unsurprisingly, room 69105c!"

when play begins:
	say "It was a brutal marathon, and all you had to do to win $1000 was not be the first person to give up or mess up on Towers of Hanoi, eight-high. There were ten others.[paragraph break]But you did, before you'd moved one tower over. 'I ... just got distracted ...' you protested, but it was no good.[paragraph break]The punishment ... well, not like death or anything, just the event organizers booming 'You too good for Towers of Hanoi? Well, let's give you a real puzzle!' as a trap door opened and you fell to... (push any key)";
	if debug-state is false, wait for any key;
	now right hand status line is "[if player is in room 50196]NE or NW[else if cur-guesses > 15]15+[else][gessiz][end if]";
	random-reset;

to random-reset:
	reshuffle-a;
	reshuffle-bc;
	now cur-guesses is 0;

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
		repeat through K:
			now gyet entry is false;
		table-num-shuf K;
		let Q be a random number between 1 and number of rows in K;
		choose row Q in K;
		if weight entry is 1:
			let Q2 be a random number between 1 and (number of rows in K) - 1;
			if Q2 >= Q, increment Q2;
			now Q is Q2;
		now badnum of X is Q;

to reshuffle-bc:
	repeat with X running through not aroom keystrucs:
		table-num-shuf klist of X;
		repeat through klist of X:
			now gyet entry is false;

volume standard verbs

the block waking up rule is not listed in any rulebook.

check waking up: say "If this is a nightmare, there are worse ones." instead;

chapter swearing

the block swearing obscenely rule is not listed in any rulebook.
the block swearing mildly rule is not listed in any rulebook.

check swearing obscenely: try swearing mildly instead;
check swearing mildly: say "There's no proof swearing will help you think better, but more importantly, there's no proof it won't." instead;

chapter thinking

the block thinking rule is not listed in any rulebook.

check thinking: say "[b]H[r] or [b]HELP[r] or [b]HINT[r] will give you general glues, and [b]G[r] or [b]GUESS[r] will show all your guesses." instead;

chapter yes / no

the block saying no rule is not listed in any rulebook.
the block saying yes rule is not listed in any rulebook.

check saying yes: say "Aha! You have an idea!" instead;
check saying no: say "You ponder your next guess. Not quite." instead;

volume odd verbs

definition: a direction (called di) is viable:
	if di is south and player is in room 50196 and can-exit, yes;
	if di is north and room-c-available, yes;
	if the room di of location of player is nothing, no;
	yes;

chapter guessing

Include (-

	#Undef AGAIN1__WD;
	Constant AGAIN1__WD = ' ';
	#Undef AGAIN2__WD;
	Constant AGAIN2__WD = ' ';
	#Undef AGAIN3__WD;
	Constant AGAIN3__WD = ' ';

-) after "Language.i6t".

guessing is an action out of world.

understand the command "guesses" as something new.
understand the command "guess" as something new.
understand the command "g" as something new.

understand "guesses" as guessing.
understand "guess" as guessing.
understand "g" as guessing.

carry out guessing:
	if player is in room 50196, say "You aren't in a guessing room. They are [list of viable directions]." instead;
	if number of entries in guess-list is 0, say "You've made no guesses yet." instead;
	let count be 0;
	repeat with G running through guess-list:
		increment count;
		say "Guess [count]: [G]";

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
	say "This game is based on David Welbourn's original [i]69105 Keys[r], which I had fun with, and which you should play. He mentioned it was a coding exercise for him (you can search for the code online--69105.inf, or David Welbourn, with site:plover.net,) but it seemed like it might be tricky in Inform 7.[paragraph break]Challenge accepted! But I didn't want to copy his puzzle mechanics, and I didn't come close to replicating all the neat jokes he put in his game. And I wondered. Was there any way I could make 69105 more symmetrical? It turns out that 69105 factors a few ways, and it's also close to a number that factors conveniently.[paragraph break]I had it in my head for a while, and it seemed like the perfect sort of game to submit to the Spring Thing back garden, which I did in 2019.[paragraph break]Perhaps it would be a good coding exercise for Twine, too, or even Python or Perl. For Twine, you could click on your next guess, and the number of keys left would appear. For Python/Perl, you could construct a stripped-down parser. Writing (relatively) simple math/logic games like this could be good to learn new programming languages. You can also see who helped with this game with [b]CREDITS[r].";
	say "[line break]The source is online at https://github.com/andrewschultz/69105-more-keys.";
	if bad-keys-found is 0, say "[line break]By the way, you can try to find the absolute worst key for fun in [score-desc of room 69105a].";
	say "[line break]Also, you may find it tricky to type and re-type things manually, so using the up arrow to give a copy of your previous command will likely save time and frustration. You can also abbreviate the adjectives to three letters. Only two pairs are ambiguous."; [?? smart ambiguity]
	say "[line break]And finally, scratch paper may help. You may wish to track what you've guessed, even though you have [b]GUESS[r] as a command in-game.";
	the rule succeeds;

chapter creditsing

creditsing is an action applying to nothing.

understand the command "credits" as something new.
understand the command "credit" as something new.
understand the command "credi" as something new.
understand the command "cred" as something new.
understand the command "cre" as something new.
understand the command "cr" as something new.
understand the command "c" as something new.

understand "credits" as creditsing.
understand "credit" as creditsing.
understand "credi" as creditsing.
understand "cred" as creditsing.
understand "cre" as creditsing.
understand "cr" as creditsing.
understand "c" as creditsing.

carry out creditsing:
	say "Thanks to Stian for printing a bug report to intfiction.com. Thanks to Aaron Reed for hosting Spring Thing 2019 as well as previous iterations. Thanks to you for playing.";
	the rule succeeds.

chapter verbsing

verbsing is an action applying to nothing.

understand the command "verbs" as something new.
understand the command "verb" as something new.
understand the command "ver" as something new.
understand the command "ve" as something new.
understand the command "v" as something new.

understand "verbs" as verbsing.
understand "verb" as verbsing.
understand "ver" as verbsing.
understand "ve" as verbsing.
understand "v" as verbsing.

carry out verbsing:
	say "[b]SCORE[r] gives the score which, here, is a summary of the guesses you've needed each time in each room.[line break][b]GUESS[r] will show your previous guesses.[paragraph break]Otherwise, you can sling together adjectives, and the command parser will scoop them all up and see which work. For instance, [b]X PINK KEY[r] will have the same effect as [b]TAKE PINK[r] or even [b]PINK[r]. If you have one adjective typed in, the parser will assume you are guessing.[paragraph break]But there's more! You can often abbreviate an attribute. The parser tries to guess this.[paragraph break]Finally, you can abbreviate most adjectives to three letters, though the game will poke you about ambiguities. So, semantically, this command should have been called [b]ADJECTIVES[r], though I always use [b]VERBS[r] to show what you need to do.[paragraph break][b]HON[r] and [b]HOFF[r] also toggle headers which help to organize what you've guessed and the abbreviations for what to guess.";
	the rule succeeds.

volume parser errors

rule for printing a parser error:
	if player is in room 50196 and the player's command includes "arrow":
		say "The arrows are just there to give directions. You don't need to do anything with them. Just go northeast or northwest" instead;
	say "[this-game] didn't recognize that. In fact, there aren't many commands it does. You may wish to use [b]VERBS[r] to see what it does. It's more about counting keys than smelling the flowers.";
	give-help;

to give-help:
	say "However, while [b]VERBS[r] displays verbs, there aren't many you need to use[if player is not in room 50196], though [b]GUESS[r] will remind you what you've guessed so far. You will probably need adjectives to get the right key, so perhaps [b]VERBS[r] is slightly mis-named[end if]. In fact, all you can really do here is [if player is in room 50196]go northwest or northeast to different puzzle rooms[else][b]X (ADJECTIVE COMBINATION) KEYS[r] until you get the right one[end if].[paragraph break]To save keystrokes, you can abbreviate almost all of the key descriptions with the first three letters. Descriptions with the same first three letters may need four. Similarly, you can often shorten meta-verbs.";

chapter honing

honing is an action out of world.

understand the command "hon" as something new.

understand "hon" as honing.

carry out honing:
	if big-header is true, say "But the header is already present!" instead;
	if screen width < 50 or screen height < 10, say "[this-game] requires a screen width of 50 and a height of 10 for the expanded header." instead;
	say "Enabling header[note-50196].";
	now big-header is true;
	the rule succeeds;

chapter honing

hoffing is an action out of world.

understand the command "hoff" as something new.

understand "hoff" as hoffing.

carry out hoffing:
	if big-header is false, say "But the header is already disabled!" instead;
	say "Disabling header[note-50196].";
	now big-header is false;
	the rule succeeds;

to say note-50196:
	if player is in room 50196, say " for when you choose a puzzle room"

chapter helping

helping is an action applying to nothing.

understand the command "help" as something new.
understand the command "hel" as something new.
understand the command "he" as something new.
understand the command "h" as something new.
understand the command "hint" as something new.
understand the command "hin" as something new.
understand the command "hi" as something new.

understand "help" as helping.
understand "hel" as helping.
understand "he" as helping.
understand "h" as helping.
understand "hint" as helping.
understand "hin" as helping.
understand "hi" as helping.

carry out helping:
	say "There is a walkthrough that describes strategy, if you want it. There is no actual winning state. A long-term goal of replaying the game is to decrease the number of turns needed adjectives needed.";
	give-help;
	the rule succeeds.

volume tallying results

book records

a room has a number called wins. wins of a room is usually 0.
a room has a number called moves. moves of a room is usually 0.
a room has a number called min-best. min-best of a room is usually 0.
a room has a list of numbers called room-freq. room-freq of a room is usually {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}.

book requesting the score

check requesting the score:
	if player is in Room 50196:
		say "There's not much to do here. You will want to go northwest or northeast for a[if 69105a is visited or 69105b is visited]nother[end if] challenge.";
	else:
		say "You have made [gessiz] in [location of player]. In other words, you've examined [cur-guesses] specific group[plur of cur-guesses] of keys this time in the room.";
	show-wins 69105a;
	if bad-keys-found > 0, say "You also found [bad-keys-found] bad keys in [score-desc of 69105a].";
	show-wins 69105b;
	the rule succeeds;

to say gessiz:
	say "[cur-guesses] guess[unless cur-guesses is 1]es[end if]"

to say score-desc of (rm - a room):
	say "[if player is in rm]this room[else][rm][end if]";

to show-wins (rm - a room):
	if wins of rm is 0:
		say "You don't have any wins [if player is in rm]here [end if]in [rm] yet.";
	else:
		say "You have [wins of rm] win[plur of wins of rm] [if player is in rm]here [end if]in [score-desc of rm], with [moves of rm] total move[plur of moves of rm], where [min-best of rm] is your best effort.";
		say "Here is a list of frequencies for turns taken to solve [rm]: ";
		let rmf be room-freq of rm;
		let space-yet be false;
		repeat with count running from 1 to number of entries in rmf:
			if entry count of rmf is 0, next;
			if space-yet is true, say ", ";
			now space-yet is true;
			say "[count][if count is number of entries in rmf]+[end if] tr[if count is 1]y[else]ies[end if] [entry count of rmf] time[plur of entry count of rmf]";
		say ".";

volume status line

big-header is a truth state that varies.

to first-status: (- DrawStatusLine(); -);

to say invtxt: (- style reverse; -)

rule for constructing the status line when big-header is true and player is not in room 50196:
	let nrc be number of relevant keystrucs + 1;
	deepen the status line to nrc rows;
	let count be 1;
	move the cursor to 1;
	say "[location of player]";
	right align cursor to 1;
	say "[gessiz]";
	repeat with KS running through relevant keystrucs:
		increment count;
		move the cursor to count;
		repeat through klist of KS:
			say "[if gyet entry is true][b][abbrev entry in upper case][r][invtxt][else][abbrev entry][end if] ";

volume debug - not for release

[below can be commented/uncommented as needed to perform tests.]

include 69105 More Keys Tests by Andrew Schultz.

when play begins:
	now debug-state is true;

chapter multing

multing is an action out of world.

understand the command "mult" as something new.

understand "mult" as multing.

carry out multing:
	now show-mult is whether or not show-mult is false;
	say "Showing multiplication details is now [on-off of show-mult].";
	the rule succeeds.




THE NIGHT WATCH - DIALOGUE SYSTEM

The code isn't pretty, but it works.

CONTROLS SO FAR:

Mouseover John or Barry to highlight them

Click John or Barry to initiate a dialogue ** NOTE: Only John has dialogue so far.

Press the right arrow key to preview Barry's slinking off-screen animation.

Press the left arrow key to bring him back.

THE DIALOGUE SYSTEM:

When first clicking John, the id for the first dialogue box, id "0", is called (Main.gd line 71)

This calls the john_dialogues() function, which will contain all of John's dialogues.

john_dialogues() return a multidimensional array, where the first array are the dialogue lines themselves, and the second array holds corresponding IDs for the next branch of the aforesaid dialogue lines.

The first dialogue line is always the main text of that dialogue (Usually John or Barry's line), the rest are options the player can select.

Main.gd line 71 calls a function in JohnPopup.gd with the selected array as a parameter (JohnPopup.gd line 7).

The default state for all the dialogue option buttons is to be invisible.

set_button_visibility() is called on JohnPopup.gd line 14 which determines how many buttons to make visible depending on how many dialogue options are in the current array.

set_button_labels of course prints the dialogue options on the labels. In that function (JohnPopup.gd line 32) the buttons are also given a button_id based on the information in the second array.

The final four functions of JohnPopup.gd at linked to each individual button and sends that button's id as a signal back to Main.gd line 86 which calls the next dialogue array.

TO DO:

1. Work out a system to play the dialogue when there are no dialogue options (like in the intro when it's scripted back-and-forth between the characters). Suggestion: make the first button a Continue option to forward the dialogue?

2. Load John's dialogue into john_dialogues() with corresponding ID. It doesn't have to be exactly as it is in the JSON, but it all needs to match up in Godot.

3. Copypaste a lot of code and tweak it for Barry's dialogue.

4. Copypaste a lot of code and tweak it for the Intro dialogue.

5. Figure out how to script Barry's slinking away animation and returning to the console ** NOTE: Not urgent. Worry about bells and whistles like this after the rest of the game is up and running.
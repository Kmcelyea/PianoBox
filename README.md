PianoBox
========

GUI that passes applescript to terminal window in front. For use with pianobar in terminal.

=========
Background
=========

Pandora is always fighting to lock out third party stuff from attaching to its service. I can understand that but I also don't believe enough people do it that it could harm pandora in a long run view. I have grown to love the pianobar api as it has attached in and provided me with a way to listen to music and not get those pesky commercials. 

I won't go into how to install all the stuff for pianobar in this.
I had at one point in the app and it is still there a script that executes and installs homebrew and then pianobar but it is buggy on a good day with all the changes that pianobar has had to make to keep up with pandora.

===========
Requirements
===========

These should be installed

Xcode
and then to use with the new xcode you need to install command line tools from the preferences and downloads section. 

All sorts of good stuff requires that these be present and they are optional now in Xcode 4.#.# +

===========
What it does
===========

Pianobar has a way to write to the config file inside it and store you info but some ppl might not feel like taking that approach and other might want to change accounts. I store that information in prefs and you can change it but on startup it will load old prefs from previous runs.

I currently use applescript to pass keys and bring the terminal windows to the front. NSWorkspace is used to launch terminal. Quit commands first quit pianobar and then exit terminal cleanly. It can be a bit slow going at first there seems to be a delay if terminal hasn't opened before the script is passed to it you might have to double hit the start button. This is likely due to there being a command to close terminal first then open it again to avoid any information for the startup being placed improperly.

=============
Features
=============
Basically it can do anything if scripted correctly 

Passing the "n" key will do next song
"s" key for station

etc

There is like and dislike and tired of which shelves the song.

=============
What is needed?
=============

A way to read output from terminal and bring it into the interface

Alternatively 

A terminal window in the inferace like the iTerm emulators would be nice and perhaps allow me more freedom to build features on to the GUI.

-------------
This project is just for fun and an earlier learning project that I mess with in my free time.


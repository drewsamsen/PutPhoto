########
PutPhoto
########

This is a little command line utlilty I hacked together in Ruby to save me time. It organizes photos/videos by putting them in the correct directory structure within my Dropbox folder.

Background
==========

I use [Dropbox](https://www.dropbox.com/) on my laptop, desktop, and iPhone to back up and share files.

The iPhone's Dropbox app can upload the phone's photos and videos to my Dropbox. These files end up in "Dropbox\Camera Uploads".

The Problem
===========

I like to organize my photos and videos by date. So, a photo taken on July 21st 2012 would end up in the folder "Dropbox\Media\Photos\2012\7-21-2012".

I find manually creating folders and then clicking and dragging files around is tiresome - especially doing hundreds of photos in one sitting.

The Solution
============

This utility runs from my "Camera Uploads" directory and auto-magically puts the files into the correct directory (creating it if needed, obviously) based on date.

Initial resports indicate that this utility allows me to manage my photos **57,000,000% faster** than before.

Future Plans
============

- More error chacking. Currently there is a method to check for and handle file duplication, but that is all I've had time for.
- Options to allow other users to easily configure the script for their own use.
- Making this script an .EXE file?
- PROFIT

Reflection
==========

Over all I'm happy with this little project. I initially wrote it in notepad because I was out of the office, so imagine my surprise when I coded it later that evening and it actually worked!
# PutPhoto

This is a little command line utlilty I hacked together in Ruby to save me time. 

I use Dropbox on my laptop, desktop, and iPhone to back up and share files.

The iPhone's Dropbox app will automatically upload the phone's photos and videos to Dropbox. These files end up in "Dropbox\Camera Uploads".

The problem is that all of these files need to be sorted. I like to organize my photos and videos by date. So, a photo taken on July 21st, 2012 would end up in the folder "Dropbox\Media\Photos\2012\7-21-2012"

This utility runs from the "Camera Uploads" directory and auto-magically puts the files into the correct directory (creating it if needed, obviously) based on date. 

Currently there is a method to check for and handle file duplication, but that is all I have had time to add as far as error-handling. 


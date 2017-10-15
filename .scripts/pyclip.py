#!/usr/bin/env python
import gtk
import sys
import os

count = 0
def handle_owner_change(clipboard, event):
    global count
    count += 1
    #count>2 for some computers
    if count > 1:
       sys.exit(0)

#--k means keep the screenshot
if sys.argv[1]!="--k":
    file_name = sys.argv[1]
else:
    file_name = sys.argv[2]

image = gtk.gdk.pixbuf_new_from_file(file_name)
clipboard = gtk.clipboard_get()
clipboard.connect('owner-change', handle_owner_change)
clipboard.set_image(image)
clipboard.store()
if sys.argv[1]!="--k":
    os.remove(file_name)
gtk.main()

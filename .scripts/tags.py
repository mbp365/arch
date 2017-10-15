import eyed3
import sys

filename = sys.argv[1]
audiofile = eyed3.load(sys.argv[1])
audiofile.initTag()
if len(filename.split(' - '))!=1:
    audiofile.tag.artist = unicode(filename.split(' - ')[0])
    audiofile.tag.title = unicode(filename.split(' - ')[1][:-4])
else:
    audiofile.tag.artist = u"<Unknown>"
    audiofile.tag.title = unicode(filename[:-4])
audiofile.tag.save()

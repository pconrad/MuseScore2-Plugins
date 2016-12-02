# MuseScore2-Plugins
Notes on plugin development for MuseScore 2.0

# What is MuseScore 2.0

[MuseScore 2.0](https://musescore.org/) is an open source music notation program offering functionality similar to commerical apps such as [Sibelius (by Avid)](http://www.avid.com/sibelius) and [Finale](http://www.finalemusic.com/).

# What are Plugins for MuseScore 2.0

Plugins, in any program, are little extras, often contributed by end users that know how to program, that extend a programs capabilities.  
Prior to version 2.0 of MuseScore, plugins were written in JavaScript (files with `.js` extensions).  

For a variety of good reasons, the MuseScore developers chose to go with a different language, QML, for the MuseScore plugin architecture for version 2.0 and higher.   

Unfortunately, the old `.js` type plugins from version 1.x no longer work in MuseScore 2.x.  As of late 2016, when this is being written, very few plugins seem to be available for the new plugin system.  (This may change by the time you are reading this&mdash;we can hope so, since causing that to happen is one of the reasons I'm writing this.)


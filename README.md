# MuseScore2-Plugins
Notes on plugin development for MuseScore 2.0

# What is MuseScore 2.0

[MuseScore 2.0](https://musescore.org/) is an open source music notation program offering functionality similar to commerical apps such as [Sibelius (by Avid)](http://www.avid.com/sibelius) and [Finale](http://www.finalemusic.com/).

# What are Plugins for MuseScore 2.0

Plugins, in any program, are little extras, often contributed by end users that know how to program, that extend a programs capabilities.  
Prior to version 2.0 of MuseScore, plugins were written in JavaScript (files with `.js` extensions).  

For a variety of good reasons, the MuseScore developers chose to go with a different language, QML, for the MuseScore plugin architecture for version 2.0 and higher.   

Unfortunately, the old `.js` type plugins from version 1.x no longer work in MuseScore 2.x.  As of late 2016, when this is being written, very few plugins seem to be available for the new plugin system.  (This may change by the time you are reading this&mdash;we can hope so, since causing that to happen is one of the reasons I'm writing this.)

# What are some examples of MuseScore 2.0 plugins

As of 12/02/2016, this list of plugins has 110+ plugins on it, but only one for the new system: https://musescore.org/plugins 

That one for the new system is this: https://musescore.org/en/project/addnotenameheads

You can also find a few built into MuseScore that are distributed along with the program.

Those plugins can be found the `/share/plugins` directory of the github repo for MuseScore's source code, here: https://github.com/musescore/MuseScore/tree/master/share/plugins

# How can I work with MuseScore plugins?

You can starting by downloading this github repo, containing a few plugin examples.   

* If you understand git workflow, use it (fork, clone etc.), otherwise, just download a .zip version and unzip it.
* Then, open MuseScore 2.0, and select "Plugins => Plugin Creator" from the menu.
* You can then click the "open file" icon (&#x1f4c2;) and navigate to any of the `.qml` files from this repo.
* To run the example, click the "Run" button at lower left.

# What is QML

First, its important to know what you do, and don't need to know about QML.

It helps to know that parts of QML are based on JavaScript coding
* So if you know JavaScript programming, you have a good head start.
* If you don't know JavaScript programming, hopefully you are familiar with some similar language, and can pick up languages quickly.
* If this is your first experience with programming at all, back away slowly, and go take an intro JavaScript tutorial or class.

It helps to know that [QML](http://doc.qt.io/qt-5/qtqml-index.html) is a language that is a component of QT, which is a software development framework used in the production of MuseScore, <i>if only so that you know where to look for documentation about QML</i>.

*   Much of the QML documentation on the QT websites doesn't translate directly into what you need to know for MuseScore 
    2.0 plugins, but its just about all we have.  So, we live with it.
*   The MuseScore 2.0 Plugin Creator contains its only documentation for the actual Objects that we manipulate when creating
    MuseScore 2.0 Plugins using QML, but it <em>does not seem to have any general information about the syntax of QML</em> or how
    the language actually works.  So, you have to pretty much figure that out on your own, or piece it together from scraps of
    stuff you read on QT sites for QML.
          
      

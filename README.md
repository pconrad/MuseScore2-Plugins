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

A snapshot of those from commit [a61cf1](https://github.com/musescore/MuseScore/commit/a61cf1cccd145cf8da68b56c9a1adffcb23c6859) is contained in the subdirectory [original-examples](original-examples) in this repo.

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

It helps to know that QML is a language that is a component of QT, which is a software development framework used in the production of MuseScore, <i>if only so that you know where to look for documentation about QML</i>, basically on the QML section of the QT website here: http://doc.qt.io/qt-5/qmlreference.html

*   Much of the QML documentation on the QT websites doesn't translate directly into what you need to know for MuseScore 
    2.0 plugins, but its just about all we have.  So, we live with it.
*   The MuseScore 2.0 Plugin Creator contains its only documentation for the actual Objects that we manipulate when creating
    MuseScore 2.0 Plugins using QML, but it <em>does not seem to have any general information about the syntax of QML</em> or how
    the language actually works.  So, you have to pretty much figure that out on your own, or piece it together from scraps of
    stuff you read on QT sites for QML.
          
      
# Basic Syntax of a MuseScore 2.0 Plugin in QML

Here are a few getting started basics of the syntax of a MuseScore 2.0 plugin.

## Basic Syntax of a MuseScore 2.0 plugin.

The basic syntax of a MuseScore 2.0 plus is always exactly this, with only a small number of possible variations:

```
import QtQuick 2.0
import MuseScore 1.0
MuseScore {
   // stuff goes here   
}
```

There could be a few extra imports, but this is rare.  Usually, you'll have exactly these two.  (For an exception, see: [QML-details/imports.md](QML-details/imports.md)).

The lines that start with `MuseScore` and have an open and close brace `{ ... }` comprise an *Object Declaration* according to the QML syntax rules.  The rules for QML files specify that following any import statements, there is [always exactly one root object](http://doc.qt.io/qt-5/qtqml-documents-structure.html), and it would appear that in the case of a MuseScore 2.0 plugin, that
root object should always be of type `MuseScore`.

## Basic QML Syntax

It is worth reading through this short web page that describes the basic syntax of QML.  

* http://doc.qt.io/qt-5/qtqml-syntax-basics.html

You can skim over the part about imports, since typically, you'll just use the two standard imports, and never need to know anything more about those.

Focus instead on the part about object declarations such as this one&mdash;that's worth reading, since the `MuseScore {} ` block that makes up the bulk of every MuseScore QML file is, in fact, an Object Declaration.    So understanding the syntax for these is important.

```
Rectangle {
    width: 100
    height: 100
    color: "red"
}
```

# What goes in the `MuseScore` Object Declaration?

Here's a few things that typically go inside the `MuseScore` object declaration:

* Property value pairs, such as these.  Note that some of them, such as `onRun`, may be blocks containing JavaScript code.  These are four properties that are nearly always present:

    ```
    version: "2.0"
    description: "My plugin to do awesome things"
    menuPath: "Plugins.MyAwesomePlugin"
    onRun: {
       console.log("Look... my plugin printed something!")
    }
    ```
* JavaScript function definitions, such as:

    ```
    function squared(x) {
       return x * x; 
    }
    ```
* Nested child objects, such as this `Button` definition.  Note that internally, it has a similar structure to the `MuseScore` object declaration:

    ```
      Button {
        id : buttonCancel
        text: qsTr("Cancel")
        anchors.bottom: window.bottom
        anchors.right: buttonConvert.left
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        onClicked: {
                Qt.quit();
        }
      }
    ```

# Some scary bits: attributes, properties, signals

So, it turns out that QML has a few things that might challenge your conventional notions about writing plugins being a simple matter of just writing a script, and cause you to have to scratch your head and think a bit.     Those are the distinctions between attributes and properties, and whether the value assigned to them are static or dynamic.  Yeah, real computer science here.

Check out this, and really think hard about it:  http://doc.qt.io/qt-5/qtqml-syntax-objectattributes.html

You'll see a few examples of these `property` things in the Color Notes plugin, `colornotes.qml`.  This also shows the list type, which uses the square bracket syntax ('[]'):

```
    property variant colors : [
               "#e21c48", "#f26622", "#f99d1c",
               "#ffcc33", "#fff32b", "#bcd85f",
               "#62bc47", "#009c95", "#0071bb",
               "#5e50a1", "#8d5ba6", "#cf3e96"
               ]
      property variant black : "#000000"

```

Fortunately, that seems to be the only use of the `property` keyword in the QML examples given, so we may be able to put off going down that dark alley of QML semantics for a bit.  It seems we can accomplish quite a few things without needing to know about the `property` keyword.   Whew!  Ditto for the `signal` keyword.



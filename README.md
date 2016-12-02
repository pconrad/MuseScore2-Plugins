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

It helps to know that QML is a language that is a component of QT, which is a software development framework used in the production of MuseScore, <i>if only so that you know where to look for documentation about QML</i>, basically on the QML section of the QT website here: http://doc.qt.io/qt-5/qtqml-index.html

*   Much of the QML documentation on the QT websites doesn't translate directly into what you need to know for MuseScore 
    2.0 plugins, but its just about all we have.  So, we live with it.
*   The MuseScore 2.0 Plugin Creator contains its only documentation for the actual Objects that we manipulate when creating
    MuseScore 2.0 Plugins using QML, but it <em>does not seem to have any general information about the syntax of QML</em> or how
    the language actually works.  So, you have to pretty much figure that out on your own, or piece it together from scraps of
    stuff you read on QT sites for QML.
          
      
# Basic Syntax of a MuseScore 2.0 Plugin in QML

Here are a few getting started basics of the syntax of a MuseScore 2.0 plugin.

## Imports

First, the file will always start with (at least) these two lines (as explained in this [forum post](https://musescore.org/en/node/17581)).

```
import QtQuick 2.0
import MuseScore 1.0
```

These two lines are needed for the plugin to be able to run at all, and in order to access all of objects that are of interest in MuseScore (i.e. the parts of a score.)    

* `import QtQuick 2.0` is explained a bit on [this page](http://doc.qt.io/qt-5/qtqml-syntax-imports.html), though its probably more information that you will need to know.
* `import MuseScore 1.0` presumably gives you access to all of the items listed under "Score Elements" in the help menu at the right hand side of the MuseScore Plugin Creator window.

There may sometimes be other imports.  For example, the ABC Import example has these  imports in addition to the ones above.

```
import QtQuick.Dialogs 1.0
import QtQuick.Controls 1.0
import FileIO 1.0
```

* `QtQuick.Dialogs` is documented here: http://doc.qt.io/qt-5/qtquickdialogs-index.html
* `QtQuick.Controls` is documented here: http://doc.qt.io/qt-5/qtquickcontrols-index.html
* An example of `import FileIO 1.0` can be found [here](http://stackoverflow.com/questions/8894531/reading-a-line-from-a-txt-or-csv-file-in-qml-qt-quick), though it's not entirely clear how relevant it is to a MuseScore context. (Scroll to bottom to see the QML file.)

## The `MuseScore` block:

The next thing you'll typically see is a big block of code that looks like this:

```
MuseScore {
   // stuff goes here   
}
```

Pretty much all of your code is going to go in this block.   

What can you put in this block?

The following things:

* Property value pairs, such as these.  Note that some of them, such as `onRun`, may be blocks containing JavaScript code.

    ```
    menuPath: "Plugins.MyAwesomePlugin"
    version: "2.0"
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
* Nested items, such as this `Button` definition.  Note that internally, it has a similar structure to the `MuseScore` definition.

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

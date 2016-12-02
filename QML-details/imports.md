# Imports

A QML file for a MuseScore 2.0 plugin will almost always start with (at least) these two lines (as explained in this [forum post](https://musescore.org/en/node/17581)).

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


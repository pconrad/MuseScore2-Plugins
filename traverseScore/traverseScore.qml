import QtQuick 2.0
import MuseScore 1.0


MuseScore {
    menuPath:    "Plugins.traverseScore"
    version:     "2.0"
    description: qsTr("This demo plugin traverses a score")

    function processElement(element) {
              console.log("element: " + element)
    }

    function processAllSegments(measure) {    
        var segment = measure.firstSegment
        while (segment) {
            var element
            element = segment.elementAt(0)
            processElement(element);
            segment = segment.next
       }
    }

    onRun: {
        console.log(qsTr("hello world"));
        if (typeof curScore === 'undefined')
            Qt.quit();
       
        var score = curScore
        console.log(curScore)
        console.log(score.name)
        var m
        m = score.firstMeasure
        var measureNumber = 1;
        while (m) {
            console.log("measure " + measureNumber + ": " + m)
            processAllSegments(m); 
            m = m.nextMeasure
            measureNumber++;
         }
         Qt.quit()
   }
}


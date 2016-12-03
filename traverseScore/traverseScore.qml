import QtQuick 2.0
import MuseScore 1.0


MuseScore {
    menuPath:    "Plugins.traverseScore"
    version:     "2.0"
    description: qsTr("This demo plugin traverses a score")

   function processNote(note) {
     console.log("note: " + note + " .pitch: " + note.pitch + " .line " + note.line);
  }

   function processChord(chord) {
      console.log("chord.notes.length=" + chord.notes.length);
      for (var i=0; i<chord.notes.length; i++) {
        processNote(chord.notes[i]);
     }
   }

    function processElement(element) {
        console.log("element: " + element)
        switch (element.type) {
           case Element.CHORD:
               processChord(element);
                
              break;
           default: 
              break;
      }
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


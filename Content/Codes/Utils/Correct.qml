import QtQuick 2.0
import QtMultimedia 5.9

Image {
    id: img_incorrect
    source: "qrc:/Content/Images/Util/correct.png"

    sourceSize.width: 130
//    sourceSize.height: 130
    fillMode: Image.PreserveAspectFit
    visible: false

    signal animate()
    onAnimate: incorrectAnim.restart()

    SequentialAnimation{
        id: incorrectAnim

        NumberAnimation {
            target: img_incorrect
            property: "scale"; from: 0.1; to: 1.0
            duration: 500
            easing.type: Easing.InOutQuad
        }
        PauseAnimation{duration: 500}
        NumberAnimation {
            target: img_incorrect
            property: "scale"; from: 1.0; to: 0.0
            duration: 500
            easing.type: Easing.InOutQuad
        }
        onStarted:{
            root.ringCorrect()
            img_incorrect.visible = true
        }
        onStopped: img_incorrect.visible = false
    }
}


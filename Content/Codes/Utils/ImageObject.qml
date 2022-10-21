import QtQuick 2.11

Image {
    id: img_gift

    property bool isCorrect: false
    signal correctSelected()

    signal mRelease(var mouseX, var mouseY)
    signal mPress(var mouseX, var mouseY)
    signal mClick()

    signal animateIncorrect()
    onAnimateIncorrect: img_incorrect.animate()

    //-- verify disable flag --//
    property bool isVerifyActive: true

    //-- darg flag --//
    property bool isDragActive: false

    //-- birder viisible flag --//
    property bool isShowBorder: false

    source: "qrc:/Content/Images/Exams/exam1/gift.png"
    x: 0//body_exam1.width * 0.1
    y: 0//body_exam1.height * 0.1


    //-- incorrect anim --//
    Incorrect{
        id: img_incorrect
        anchors.centerIn: parent
        sourceSize.width: Math.min(img_gift.height, img_gift.width) * 0.8
    }

    //-- correct anim --//
    Correct{
        id: img_correct
        anchors.centerIn: parent
        sourceSize.width: Math.min(img_gift.height, img_gift.width) * 0.8
    }

    Timer{
        id: timer_correct
        running: false; repeat: false
        interval: 1000
        onTriggered: correctSelected()
    }

    Drag.active: dragArea.drag.active


    //-- mouse click anim --//
    ClickAnim{
        id: pressAnimItem
    }

    Rectangle{anchors.fill: parent; border.width: 1; color: "transparent"; visible: isShowBorder}


    PinchArea{
        anchors.fill: parent

        pinch.target: img_gift

        pinch.minimumRotation: -360
        pinch.maximumRotation: 360
        pinch.minimumScale: 0.1
        pinch.maximumScale: 10
        pinch.dragAxis: Pinch.XAndYAxis
        //                    onPinchStarted: setFrameColor();
        property real zRestore: 0
        onSmartZoom: {
            if (pinch.scale > 0) {
                img_gift.rotation = 0;
                img_gift.height += img_gift.height * 0.1 //Math.min(root.width, root.height) / Math.max(image.sourceSize.width, image.sourceSize.height) * 0.85
                zRestore = img_gift.z
                img_gift.z = ++root.highestZ;
            } else {
                img_gift.rotation = pinch.previousAngle
                img_gift.height -= img_gift.height * 0.1
                //                            img_gift.x = pinch.previousCenter.x - img_gift.width / 2
                //                            img_gift.y = pinch.previousCenter.y - img_gift.height / 2
                img_gift.z = zRestore
                --root.highestZ
            }
        }


        MouseArea{
            id: dragArea

            anchors.fill: parent
            drag.target: isDragActive ? img_gift : undefined
            scrollGestureEnabled: true

            onPressed:{
                mPress(mouseX, mouseY)

                pressAnimItem.animate(mouseX, mouseY)

            }

            onReleased: mRelease(mouseX, mouseY)

            onClicked: {

                mClick()

                //-- check verify flag --//
                if(!isVerifyActive) return

                if(isCorrect){
                    img_correct.animate()
                    timer_correct.restart()
                }
                else img_incorrect.animate()
            }
        }
    }

}

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'
import '../Utils/Utils.js' as Util

Item {
    id: body_exam1

    property int slice_w: body_exam1.width * 0.1
    property int slice_h: body_exam1.height * 0.1

    //-- show item border --//
    property bool isBorderShow: false

    //-- item list --//
    property var objList: []

    MouseArea{
        anchors.fill: parent

        onPressed: {
            pressAnimItem.animate(mouseX, mouseY)
        }
    }

    //-- items --//
    ColumnLayout{
        anchors.fill: parent

        //-- question --//
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: lbl_question2.implicitHeight * 1.5

            Label{
                id: lbl_question2

                horizontalAlignment: Qt.AlignHCenter
                width: parent.width * 0.9
                wrapMode: Text.Wrap
                text: "زرافه    رو تو یخچال بذار"
            }
        }


        //-- objects --//
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Image {
                visible: false
                id: name1
                property real sizeRatio: 2.2

                source: "qrc:/Content/Images/Exams/exam_girrafiIntoFridge/fridge.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.6
                x: parent.width * 0.5

                PinchArea{
                    anchors.fill: parent

                    pinch.target: name1

                    pinch.minimumRotation: -360
                    pinch.maximumRotation: 360
                    pinch.minimumScale: 0.1
                    pinch.maximumScale: 10
                    pinch.dragAxis: Pinch.XAndYAxis
//                    onPinchStarted: setFrameColor();
                    property real zRestore: 0
                    onSmartZoom: {
                        if (pinch.scale > 0) {
                            name1.rotation = 0;
                            name1.sourceSize.height += name1.sourceSize.height * 0.1 //Math.min(root.width, root.height) / Math.max(image.sourceSize.width, image.sourceSize.height) * 0.85
                            zRestore = name1.z
                            name1.z = ++root.highestZ;
                        } else {
                            name1.rotation = pinch.previousAngle
                            name1.sourceSize.height -= name1.sourceSize.height * 0.1
//                            name1.x = pinch.previousCenter.x - name1.width / 2
//                            name1.y = pinch.previousCenter.y - name1.height / 2
                            name1.z = zRestore
                            --root.highestZ
                        }
                    }
                }
            }

            //-- fidge --//
            ImageObject{
                id: fridge

                signal reset()
                onReset: {
                    y = parent.height * 0.6
                    x = parent.width * 0.5
                }

                property real sizeRatio: 2.2

                source: "qrc:/Content/Images/Exams/exam_girrafiIntoFridge/fridge.png"

                height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.6
                x: parent.width * 0.5

                isDragActive: true

                onMRelease: {
                    var status = Util.isContain(body_exam1, girrafi, fridge, 30);
                    print("status: ", status)
                    if(status === 'SRC_IN_DES'){

                        img_correct.animate()
                        timer_correct.restart()
                    }
                }

                Component.onCompleted: objList.push(fridge)
            }

            //-- girrafi --//
            ImageObject{               
                id: girrafi

                signal reset()
                onReset: {
                    y = parent.height * 0.1
                    x = parent.width * 0.1
                }

                property real sizeRatio: 3.5

                source: "qrc:/Content/Images/Exams/exam_girrafiIntoFridge/girrafi.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.1
                x: parent.width * 0.1
                Behavior on x{NumberAnimation{duration: 200}}
                Behavior on y{NumberAnimation{duration: 200}}

                isDragActive: true

                isCorrect: false
                onCorrectSelected: done.animate()

                onMRelease: {
                    print(width, height)
                    var status = Util.isContain(body_exam1, girrafi, fridge, 30);
                    print("status2: ", status)
                    if(status === 'SRC_IN_DES'){

                        img_correct.animate()
                        timer_correct.restart()
                    }
                }

                Component.onCompleted: objList.push(girrafi)
            }

        }

    }

    /*MultiPointTouchArea {
            anchors.fill: parent
            touchPoints: [
                TouchPoint { id: point1 },
                TouchPoint { id: point2 }
            ]
        }

        Rectangle {
            width: 30; height: 30
            color: "green"
            x: point1.x
            y: point1.y
        }

        Rectangle {
            width: 30; height: 30
            color: "yellow"
            x: point2.x
            y: point2.y
        }*/



    //-- correct anim --//
    Correct{
        id: img_correct
        anchors.centerIn: parent
        sourceSize.width: Math.min(body_exam1.height, body_exam1.width) * 0.3
    }

    Timer{
        id: timer_correct
        running: false; repeat: false
        interval: 1000
        onTriggered: done.animate()
    }


    //-- mouse click anim --//
    ClickAnim{
        id: pressAnimItem
    }

    //-- finish win --//
    FinishWin{
        id: done
    }

    Connections{
        target: root

        onResetGameState: {
            reset()
        }
    }

    //-- reset state --//
    function reset(){
        for(var i=0; i< objList.length; i++){
            objList[i].reset()
        }
    }

}

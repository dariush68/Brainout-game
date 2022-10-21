import QtQuick 2.0
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

                anchors.centerIn: parent
                width: parent.width * 0.9
                wrapMode: Text.Wrap
                text: "چیزی پیدا کن که بشه خورد؟"
            }
        }


        //-- objects --//
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            GridLayout{
                anchors.fill: parent
                anchors.leftMargin: parent.width * 0.1
                anchors.rightMargin: parent.width * 0.1
                anchors.topMargin: parent.height * 0.1
                anchors.bottomMargin: parent.height * 0.1

                rows: 2
                columns: 2
                rowSpacing: 10
                columnSpacing: 10


                //-- plate --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: plate

                        signal reset()
                        onReset: {
                            x = 0
                            y = parent.height * 0.2
                        }

                        property real sizeRatio: 3.0

                        source: "qrc:/Content/Images/Exams/exam_canEatMeat/plate.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        y: parent.height * 0.2

                        isDragActive: true

                        isCorrect: false
                        onCorrectSelected: done.animate()

                        Component.onCompleted: objList.push(plate)
                    }
                }

                //-- meatBody --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: meatBody

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = 0
                        }

                        property real sizeRatio: 3

                        source: "qrc:/Content/Images/Exams/exam_canEatMeat/meatBody.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2

                        isDragActive: true

                        Component.onCompleted: objList.push(meatBody)
                    }


                    //-- chiken --//
                    ImageObject{
                        id: meatHead

                        signal reset()
                        onReset: {
                            x = -parent.width
                            y = parent.height * 0.7
                        }

                        source: "qrc:/Content/Images/Exams/exam_canEatMeat/meatHead.png"

                        sourceSize.width: meatBody.width * 0.7
                        fillMode: Image.PreserveAspectFit
                        x: -parent.width
                        y: parent.height * 0.7

                        isDragActive: true

                        Component.onCompleted: objList.push(meatHead)

                        SequentialAnimation{
                            id: meat_anim
                            NumberAnimation {
                                target: meatHead
                                property: "x"
                                duration: 100; to: meatBody.x + meatBody.width*0.13
                                easing.type: Easing.InOutQuad
                            }

                            NumberAnimation {
                                target: meatHead
                                property: "y"
                                duration: 100; to: meatBody.y + meatBody.height*0.13
                                easing.type: Easing.InOutQuad
                            }
                        }


                        onMRelease: {
                            const status = Util.isContain(body_exam1, meatHead, meatBody, 30);
                            if(status !== ''){
                                meat_anim.start()

                                img_correct.animate()
                                timer_correct.restart()
                            }
                        }

                    }

                }

                //-- clock --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: clock

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height - height
                        }

                        property real sizeRatio: 3

                        source: "qrc:/Content/Images/Exams/exam_canEatMeat/clock.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height - height

                        isDragActive: true

                        isCorrect: true
                        onCorrectSelected: done.animate()

                        Component.onCompleted: objList.push(clock)

                    }
                }

                //-- bucket --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: bucket

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 3

                        source: "qrc:/Content/Images/Exams/exam_canEatMeat/bucket.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: true

                        Component.onCompleted: objList.push(bucket)

                    }
                }

            }
        }

    }


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

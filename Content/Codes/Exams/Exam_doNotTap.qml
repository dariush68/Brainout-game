import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'
import '../Utils/Utils.js' as Util

Item {
    id: body_exam1

    property bool isActive: false
    onIsActiveChanged: {
        print("start tap")
        if(isActive){
            timer_counter.count = 10;
            timer_counter.start()
        }
        else{
            timer_counter.stop()
        }
    }

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
                text: "دکمه رو نزن"
            }
        }


        //-- objects --//
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            //-- earth --//
            ImageObject{
                id: earth

                property real sizeRatio: 3

                source: "qrc:/Content/Images/Exams/exam_doNotTap/earth.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter

                //-- counter --//
                Label{
                    id: counter

                    anchors.centerIn: parent
                    font.pixelSize: 50
                    text: ""
                }
            }

            //-- button --//
            ImageObject{
                id: button

                property real sizeRatio: 1.5

                source: "qrc:/Content/Images/Exams/exam_doNotTap/button.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.8 - height
                x: parent.width/2 - width/2
//                anchors.top: earth.bottom
//                anchors.topMargin: height

                isVerifyActive: false

                onMPress: {
                    button.source = "qrc:/Content/Images/Exams/exam_doNotTap/button_press.png"
                }

                onMRelease: {
                    button.source = "qrc:/Content/Images/Exams/exam_doNotTap/button.png"
                    earth.source = "qrc:/Content/Images/Exams/exam_doNotTap/earthExplosion.png"
                    timer_earth.restart()
                    img_incorrect.animate()
                    //-- reset count delay --//
                    timer_counter.count = 10;
                }


            }

        }

    }


    //-- incorrect anim --//
    Incorrect{
        id: img_incorrect
        anchors.centerIn: parent
        sourceSize.width: Math.min(body_exam1.height, body_exam1.width) * 0.3
    }

    //-- correct anim --//
    Correct{
        id: img_correct
        anchors.centerIn: parent
        sourceSize.width: Math.min(body_exam1.height, body_exam1.width) * 0.3
    }

    //-- timer for show finish win --//
    Timer{
        id: timer_correct
        running: false; repeat: false
        interval: 1000
        onTriggered: done.animate()
    }

    //-- timer for earth explotion --//
    Timer{
        id: timer_earth
        interval: 1000
        onTriggered: earth.source = "qrc:/Content/Images/Exams/exam_doNotTap/earth.png"
    }

    //-- timer for show counter --//
    Timer{
        id: timer_counter

        property int count: 10
        running: false; repeat: true
        interval: 1000
        onTriggered:{

            if(count <= 3){
                counter.text = count

                if(count <= 0){
                    img_correct.animate()
                    timer_correct.restart()
                    timer_counter.stop()
                    counter.text = ""
                }
            }
            else{
                counter.text = ""
            }

            count--;

        }
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
        timer_counter.count = 10;
        timer_counter.start()
    }

}

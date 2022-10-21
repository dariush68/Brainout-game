import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'

Item {
    id: body_exam1

    property alias pressItem: pressAnimItem

    property int slice_w: body_exam1.width * 0.1
    property int slice_h: body_exam1.height * 0.1

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
                text: "جغد رو بیدار کن"
            }
        }

        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout{
                anchors.fill: parent

                //-- space --//
                Item{Layout.preferredHeight: body_exam1.height * 0.05}

                //-- image --//
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "#00000000"

                    Image {
                        id: img_tree

                        source: "qrc:/Content/Images/Exams/exam_wakeupOwl/chrismasTree.png"
                        sourceSize.height: parent.height * 0.9
                        fillMode: Image.PreserveAspectFit

                        anchors.horizontalCenter: parent.horizontalCenter


                        ImageObject{
                            id: sunSmile

                            source: "qrc:/Content/Images/Exams/exam_wakeupOwl/sunSmile.png"

                            sourceSize.width: parent.height * 0.3
                            fillMode: Image.PreserveAspectFit
                            y: 0
                            x: parent.width - (sunSmile.implicitWidth*0.5)

                            isDragActive: true
                            isVerifyActive: false

                            onMRelease: {
                                var kk = body_exam1.mapFromItem(parent, x, y)

                                //-- check border corr. --//
                                if(kk.x < -width*0.7){
                                    print("in left border")
                                    nightMode()

                                }
                                if(kk.x > body_exam1.width - width*0.3){
                                    print("in right border")
                                    nightMode()
                                }
                                /*if(kk.y < -height*0.7){
                                    print("in up border")
                                }
                                if(kk.y > body_exam1.height - height*0.3){
                                    print("in down border")
                                }*/
                            }
                        }

                    }
                }
            }

        }
    }

    Rectangle{
        id: night

        visible: false

        anchors.fill: parent
        anchors.margins: -50
        anchors.topMargin: -25
        color: "#55000000"
    }


    //-- mouse click anim --//
    ClickAnim{
        id: pressAnimItem
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

    Timer{
        id: timer_correct
        running: false; repeat: false
        interval: 1000
        onTriggered: done.animate()
    }

    //-- finish win --//
    FinishWin{
        id: done
    }
    //-- connect to main signal --//
    Connections{
        target: root

        onResetGameState: {
            reset()
        }
    }

    //-- reset state --//
    function reset(){

        sunSmile.y = 0
        sunSmile.x = sunSmile.parent.width - (sunSmile.implicitWidth*0.5)

        sunSmile.visible = true
        night.visible = false
        img_tree.source = "qrc:/Content/Images/Exams/exam_wakeupOwl/chrismasTree.png"
    }

    function nightMode(){

        sunSmile.visible = false
        night.visible = true
        img_tree.source = "qrc:/Content/Images/Exams/exam_wakeupOwl/chrismasTreeOwlWakedup.png"

        img_correct.animate()
        timer_correct.restart()
    }

}

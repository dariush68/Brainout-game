import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'

Item {
    id: body_exam1

    property int slice_w: body_exam1.width * 0.1
    property int slice_h: body_exam1.height * 0.1

    clip: true

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



            Flow{
                anchors.fill: parent
                anchors.rightMargin: parent.width * 0.05
                layoutDirection: Qt.RightToLeft
                spacing: 0

                Label{

                    text: "تیره ترین"

                    ImageObject{

                        source: ""
                        anchors.fill: parent

                        isVerifyActive: true
                        isCorrect: true
                        onCorrectSelected: done.animate()

                    }
                }

                Label{
                    id: lbl_question2

                    wrapMode: Text.Wrap
                    text: " رنگ رو تو صفحه پیدا کن!"
                }

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


                    ImageObject{
                        id: colors

                        source: "qrc:/Content/Images/Exams/exam_darkestColor/colors.png"

                        sourceSize.width: parent.width * 0.8
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent

                        isVerifyActive: true

                    }


                }
            }

        }
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

    }

}

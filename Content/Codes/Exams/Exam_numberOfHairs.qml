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

            Label{
                id: lbl_question2

                anchors.centerIn: parent
                width: parent.width * 0.9
                wrapMode: Text.Wrap
                text: "تعداد موهاشو بشمرید"
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

                        source: "qrc:/Content/Images/Exams/exam_numberOfHairs/person.png"
                        sourceSize.height: parent.height * 0.8
                        fillMode: Image.PreserveAspectFit

                        anchors.horizontalCenter: parent.horizontalCenter

                        ImageObject{
                            id: hair

                            source: "qrc:/Content/Images/Exams/exam_numberOfHairs/hairs.png"

                            sourceSize.width: parent.width * 0.9
                            fillMode: Image.PreserveAspectFit
                            y: 2
                            x: parent.width/2 - width/2

                            isDragActive: true
                            isVerifyActive: false

                        }

                    }
                }

                //-- buttons --//
                Item {
                    Layout.preferredHeight: parent.height * 0.4
                    Layout.fillWidth: true

                    ColumnLayout{
                        anchors.fill: parent
                        anchors.leftMargin: parent.width * 0.1
                        anchors.rightMargin: parent.width * 0.1
                        anchors.topMargin: parent.height * 0.1
                        anchors.bottomMargin: parent.height * 0.1

                        //-- number --//
                        Item{
                            id: img_btn8

                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            Minput{
                                id: input_num
                            }

                        }


                        //-- confirm --//
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            color: "#00ff0000"

                            ImageObject{
                                id: img_btn11

                                source: "qrc:/Content/Images/Util/Button.png"

                                sourceSize.height: parent.height * 0.8
                                fillMode: Image.PreserveAspectFit
                                anchors.centerIn: parent

                                isShowBorder: false
                                isVerifyActive: false

                                Label{
                                    text: "بررسی"
                                    anchors.centerIn: parent
                                    font.pixelSize: 28
                                }

                                onMClick: {


                                    if(input_num.num == "3"){
                                        img_correct.animate()
                                        timer_correct.restart()
                                    }
                                    else img_incorrect.animate()

                                }
                            }


                        }

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

        hair.y = 2
        hair.x = hair.parent.width/2 - hair.width/2
        input_num.num = ""
    }


}

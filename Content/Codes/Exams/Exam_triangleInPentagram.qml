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
                text: "چند تا مثلث تو پنج ضلعی هستش؟"
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

                        source: "qrc:/Content/Images/Exams/exam_triangleInPentagram/pentagram.png"
                        sourceSize.height: parent.height * 0.95
                        fillMode: Image.PreserveAspectFit

                        anchors.horizontalCenter: parent.horizontalCenter

                    }
                }

                //-- buttons --//
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

                        //-- number --//
                        Item{
                            id: img_btn8

                            Layout.row: 0
                            Layout.column: 0
                            Layout.columnSpan: 2
                            Layout.preferredHeight: number.itmHeigh
                            Layout.fillWidth: true

                            Mnumber{
                                id: number
                            }

                        }

                        //-- clear --//
                        ImageObject{
                            id: img_btn10

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 1
                            Layout.column: 0
//                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit
                            isShowBorder: false
                            isVerifyActive: false

                            Label{
                                text: "پاک کن"
                                anchors.centerIn: parent
                                font.pixelSize: 28
                            }

                            onMClick: {
                                number.num = 0;
                            }
                        }

                        //-- confirm --//
                        ImageObject{
                            id: img_btn11

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 1
                            Layout.column: 1
                            Layout.fillWidth: true

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit
                            isShowBorder: false
                            isVerifyActive: false

                            Label{
                                text: "بررسی"
                                anchors.centerIn: parent
                                font.pixelSize: 28
                            }

                            onMClick: {


                                if(number.num == 11){
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

        number.num = 0;
    }


}

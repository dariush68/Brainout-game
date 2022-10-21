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
                text: "اردک ها چندتا هستن؟"
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
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Image {

                        source: "qrc:/Content/Images/Exams/exam2/ducks.png"
                        sourceSize.width: parent.width * 0.9
                        fillMode: Image.PreserveAspectFit

                        anchors.left: parent.left
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

                        //-- 8 --//
                        ImageObject{
                            id: img_btn8

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 0
                            Layout.column: 0

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit

                            Label{
                                text: "8"
                                anchors.centerIn: parent
                                font.pixelSize: 28
                            }
                        }

                        //-- 8 --//
                        ImageObject{
                            id: img_btn9

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 0
                            Layout.column: 1

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit

                            Label{
                                text: "9"
                                anchors.centerIn: parent
                                font.pixelSize: 28
                            }

                            isCorrect: true
                            onCorrectSelected: done.animate()
                        }

                        //-- 8 --//
                        ImageObject{
                            id: img_btn10

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 1
                            Layout.column: 0

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit

                            Label{
                                text: "10"
                                anchors.centerIn: parent
                                font.pixelSize: 28
                            }
                        }

                        //-- 8 --//
                        ImageObject{
                            id: img_btn11

                            source: "qrc:/Content/Images/Util/Button.png"
                            Layout.row: 1
                            Layout.column: 1

                            sourceSize.width: slice_w * 3
                            fillMode: Image.PreserveAspectFit

                            Label{
                                text: "11"
                                anchors.centerIn: parent
                                font.pixelSize: 28
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

    //-- finish win --//
    FinishWin{
        id: done
    }

}

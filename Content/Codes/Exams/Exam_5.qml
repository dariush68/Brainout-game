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
                text: "کدوم یکی از دست ها بیشتر شبیه دست بابانوئل هستش؟"
            }
        }


        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout{
                anchors.fill: parent

                //-- space --//
                Item{Layout.preferredHeight: body_exam1.height * 0.05}


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

                        rows: 4
                        columns: 2
                        rowSpacing: 10
                        columnSpacing: 10

                        //-- hand 1 --//
                        ImageObject{
                            id: img_hand_1

                            source: "qrc:/Content/Images/Exams/exam5/hand_1.png"
                            Layout.row: 0
                            Layout.column: 0
                            Layout.alignment: Qt.AlignCenter

                            sourceSize.width: slice_w * 1.5
                            fillMode: Image.PreserveAspectFit

                        }

                        //-- hand 2 --//
                        ImageObject{
                            id: img_hand_2

                            source: "qrc:/Content/Images/Exams/exam5/hand_2.png"
                            Layout.row: 1
                            Layout.column: 0
                            Layout.alignment: Qt.AlignCenter

                            sourceSize.width: slice_w * 1.5
                            fillMode: Image.PreserveAspectFit

                        }

                        //-- hand 3 --//
                        ImageObject{
                            id: img_hand_3

                            source: "qrc:/Content/Images/Exams/exam5/hand_3.png"
                            Layout.row: 2
                            Layout.column: 0
                            Layout.alignment: Qt.AlignCenter

                            sourceSize.width: slice_w * 1.5
                            fillMode: Image.PreserveAspectFit

                        }

                        //-- hand 4 --//
                        ImageObject{
                            id: img_hand_4

                            source: "qrc:/Content/Images/Exams/exam5/hand_4.png"
                            Layout.row: 3
                            Layout.column: 0
                            Layout.alignment: Qt.AlignCenter

                            sourceSize.width: slice_w * 1.5
                            fillMode: Image.PreserveAspectFit

                        }

                        //-- santa --//
                        Image{
                            id: img_santa

                            source: "qrc:/Content/Images/Exams/exam5/Santa_clause_hand.png"
                            Layout.row: 0
                            Layout.rowSpan: 4
                            Layout.column: 1
                            Layout.alignment: Qt.AlignCenter

                            sourceSize.width: slice_w * 5
                            fillMode: Image.PreserveAspectFit

                            ImageObject{
                                width: parent.width * 0.3
                                height: parent.height * 0.15
                                source: ""

                                anchors.right: parent.right
                                anchors.verticalCenter: parent.verticalCenter

                                isCorrect: true
                                onCorrectSelected: done.animate()

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

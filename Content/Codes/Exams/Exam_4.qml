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
                text: "شکلات متفاوت رو پیدا کن"
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
                columns: 3
                rowSpacing: 10
                columnSpacing: 10

                //-- candy 1 --//
                ImageObject{

                    source: "qrc:/Content/Images/Exams/exam4/candy_red.png"
                    Layout.row: 0
                    Layout.column: 0
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isDragActive: true
                }

                //-- candy 2 --//
                ImageObject{

                    source: "qrc:/Content/Images/Exams/exam4/candy_red.png"
                    Layout.row: 0
                    Layout.column: 1
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isDragActive: true
                }

                //-- candy answer --//
                ImageObject{
                    id: candy_3

                    source: "qrc:/Content/Images/Exams/exam4/candy_green.png"
                    Layout.row: 0
                    Layout.column: 2
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isCorrect: true
                    onCorrectSelected: done.animate()


                    //-- candy 3 --//
                    ImageObject{

                        source: "qrc:/Content/Images/Exams/exam4/candy_red.png"

                        sourceSize.width: slice_w * 1
                        fillMode: Image.PreserveAspectFit

                        isDragActive: true
                    }
                }

                //-- candy 4 --//
                ImageObject{

                    source: "qrc:/Content/Images/Exams/exam4/candy_red.png"
                    Layout.row: 1
                    Layout.column: 0
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isDragActive: true
                }

                //-- candy 5 --//
                ImageObject{

                    source: "qrc:/Content/Images/Exams/exam4/candy_red.png"
                    Layout.row: 1
                    Layout.column: 1
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isDragActive: true
                }

                //-- candy 6 --//
                ImageObject{

                    source: "qrc:/Content/Images/Exams/exam4/candy_red.png"
                    Layout.row: 1
                    Layout.column: 2
                    Layout.alignment: Qt.AlignCenter

                    sourceSize.width: slice_w * 1
                    fillMode: Image.PreserveAspectFit

                    isDragActive: true
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

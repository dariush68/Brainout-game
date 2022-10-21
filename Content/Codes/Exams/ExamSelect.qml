import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'

Item {
    id: body_exam1

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
                text: "بزرگترین کدومه؟"
            }
        }

        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true

            //-- gift --//
            ImageObject{
                id: img_gift

                source: "qrc:/Content/Images/Exams/exam1/gift.png"
                x: body_exam1.width * 0.1
                y: body_exam1.height * 0.1

                sourceSize.width: slice_w * 3
                fillMode: Image.PreserveAspectFit

            }

            //-- Christmas_tree -//
            ImageObject {
                id: img_Christmas_tree

                source: "qrc:/Content/Images/Exams/exam1/Christmas-tree.png"
                x: body_exam1.width * 0.7
                y: body_exam1.height * 0.2

                sourceSize.width: slice_w * 2
                fillMode: Image.PreserveAspectFit

                isCorrect: true
                onCorrectSelected: done.animate()
            }

            //-- Reindeer -//
            ImageObject {
                id: img_Reindeer

                source: "qrc:/Content/Images/Exams/exam1/Reindeer.png"
                x: body_exam1.width * 0.6
                y: body_exam1.height * 0.6

                sourceSize.width: slice_w * 3.5
                fillMode: Image.PreserveAspectFit
            }

            //-- Snow-gloves -//
            ImageObject {
                id: img_SnowGloves

                source: "qrc:/Content/Images/Exams/exam1/Snow-gloves.png"
                x: body_exam1.width * 0.15
                y: body_exam1.height * 0.7

                sourceSize.width: slice_w * 1.5
                fillMode: Image.PreserveAspectFit
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

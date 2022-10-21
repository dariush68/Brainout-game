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
                text: "به بچه اردک کمک کن آب بخوره"
            }
        }


        //-- objects --//
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            //-- water --//
            ImageObject{
                id: water

                signal reset()
                onReset: {
                    y = parent.height * 0.0
                    x = parent.width/2 - width/2
                }

                property real sizeRatio: 1.5

                source: "qrc:/Content/Images/Exams/exam_ducklingDrink/water.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.0
                x: parent.width/2 - width/2

                Component.onCompleted: objList.push(water)
            }

            //-- duckling --//
            ImageObject{
                id: duckling

                signal reset()
                onReset: {
                    y = parent.height * 0.9 - height
                    x = parent.width * 0.1
                }

                property real sizeRatio: 3.0

                source: "qrc:/Content/Images/Exams/exam_ducklingDrink/duckling.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.9 - height
                x: parent.width * 0.1
                Behavior on x{NumberAnimation{duration: 200}}
                Behavior on y{NumberAnimation{duration: 200}}

                isDragActive: true

                isCorrect: false
                onCorrectSelected: done.animate()

                Item{
                    id: duckling_con
                    width: parent.width * 0.4
                    height: width
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: -height*0.4
                }

                onMRelease: {
                    const status = Util.isContain(body_exam1, duckling_con, water, 30);
                    if(status !== ''){
                        //sunLight()
                        duckling.x = (water.x - duckling.width < 0) ? 0 : (water.x - duckling.width)
                        duckling.y = water.y - height + water.height

                        img_correct.animate()
                        timer_correct.restart()
                    }
                    else{
                        duckling.reset()
                        animateIncorrect()
                    }

                }

                Component.onCompleted: objList.push(duckling)
            }

            //-- LaboratoryContainer --//
            ImageObject{
                id: laboratoryContainer

                signal reset()
                onReset: {
                    y = parent.height * 0.9 - height
                    x = parent.width * 0.5
                }

                property real sizeRatio: 2.7

                source: "qrc:/Content/Images/Exams/exam_ducklingDrink/LaboratoryContainer.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.9 - height
                x: parent.width * 0.5
                Behavior on x{NumberAnimation{duration: 200}}
                Behavior on y{NumberAnimation{duration: 200}}

                isDragActive: true

                onMRelease: {
                    reset()
                    animateIncorrect()
                }

                Component.onCompleted: objList.push(laboratoryContainer)
            }

            //-- stone --//
            ImageObject{
                id: stone

                signal reset()
                onReset: {
                    y = parent.height * 0.6 - height
                    x = parent.width * 0.7
                }

                property real sizeRatio: 0.5

                source: "qrc:/Content/Images/Exams/exam_ducklingDrink/stone.png"

                sourceSize.height: slice_h * sizeRatio
                fillMode: Image.PreserveAspectFit
                y: parent.height * 0.6 - height
                x: parent.width * 0.7
                Behavior on x{NumberAnimation{duration: 200}}
                Behavior on y{NumberAnimation{duration: 200}}

                isDragActive: true

                onMRelease: {
                    reset()
                    animateIncorrect()
                }

                Component.onCompleted: objList.push(stone)
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

import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'

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
                text: "کدوم یکی رو نمیشه خورد؟"
            }
        }


        //-- objects --//
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


                //-- sweet doll --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: sweetsDoll

                        signal reset()
                        onReset: {
                            x = 0
                            y = parent.height/2 - height/2
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 2.0

                        source: "qrc:/Content/Images/Exams/exam_cantEaten/sweetsDoll.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        y: parent.height/2 - height/2

                        Behavior on scale {NumberAnimation{duration: 200}}

                        isDragActive: true

                        isCorrect: false
                        onCorrectSelected: done.animate()

                        Component.onCompleted: objList.push(sweetsDoll)
                    }
                }

                //-- candy --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: candy_red

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = 0
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 1.0

                        source: "qrc:/Content/Images/Exams/exam4/candy_red.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2

                        isDragActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(candy_red)
                    }
                }

                //-- plate and chiken --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: plate

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height - height
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 3

                        source: "qrc:/Content/Images/Exams/exam_cantEaten/plate.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height - height

                        isDragActive: true

                        isCorrect: true
                        onCorrectSelected: done.animate()

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(plate)

                        //-- chiken --//
                        ImageObject{
                            id: chiken

                            signal reset()
                            onReset: {
                                x = parent.width/2 - width/2
                                y = parent.height - height
                                scale = 1.0
                                visible = true
                            }

                            source: "qrc:/Content/Images/Exams/exam_cantEaten/chiken.png"

                            sourceSize.width: parent.width
                            fillMode: Image.PreserveAspectFit
                            x: parent.width/2 - width/2
                            y: parent.height - height

                            isDragActive: true

                            Behavior on scale {NumberAnimation{duration: 200}}

                            Component.onCompleted: objList.push(chiken)

                        }
                    }
                }

                //-- ice cream --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 1.5

                        source: "qrc:/Content/Images/Exams/exam_cantEaten/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream)

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

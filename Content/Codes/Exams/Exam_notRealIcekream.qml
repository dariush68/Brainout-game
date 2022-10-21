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

    //-- sunlight status --//
    property bool isSunlight: false

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
                text: "کدوم یکی بستنی واقعی نیست؟"
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

                rows: 3
                columns: 2
                rowSpacing: 10
                columnSpacing: 10


                //-- ice kream 1 --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream1

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: isSunlight ? "qrc:/Content/Images/Exams/exam_notRealIcekream/icekreamWatered.png" : "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false

                        isCorrect: false
                        onCorrectSelected: done.animate()

                        Component.onCompleted: objList.push(iceKream1)
                    }
                }

                //-- ice kream 2 --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream2

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: isSunlight ? "qrc:/Content/Images/Exams/exam_notRealIcekream/icekreamWatered.png" :  "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false
                        isVerifyActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream2)
                    }
                }

                //-- ice kream 3 --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream3

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: isSunlight ? "qrc:/Content/Images/Exams/exam_notRealIcekream/icekreamWatered.png" :  "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream3)

                    }
                }

                //-- ice cream 4 --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream4

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false

                        isCorrect: false
                        onCorrectSelected: done.animate()

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream4)

                    }
                }

                //-- ice cream 5 --//
                Rectangle{
                    Layout.row: 2
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream5

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: isSunlight ? "qrc:/Content/Images/Exams/exam_notRealIcekream/icekreamWatered.png" :  "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream5)

                    }
                }

                //-- ice cream 6 --//
                Rectangle{
                    Layout.row: 2
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: iceKream6

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                        }

                        property real sizeRatio: 1.2

                        source: isSunlight ? "qrc:/Content/Images/Exams/exam_notRealIcekream/icekreamWatered.png" :  "qrc:/Content/Images/Exams/exam_notRealIcekream/iceKream.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: false

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: objList.push(iceKream6)

                    }
                }

            }
        }

    }

    //-- center drop area --//
    Rectangle{
        id: centerDropArea

        anchors.centerIn: parent
        width: parent.width * 0.4
        height: width
        color: "transparent"
        border.width: 0
    }


    //-- sun --//
    ImageObject{
        id: sun

        signal reset()
        onReset: {
            x = 0 //parent.width/2 - width/2
            y = 0 //parent.height/2 - height/2
        }

        property real sizeRatio: 2

        source: "qrc:/Content/Images/Exams/exam_wakeupOwl/sunSmile.png"

        sourceSize.width: slice_w * sizeRatio
        fillMode: Image.PreserveAspectFit
        x: 0 //parent.width - width
        y: 0//parent.height/2 - height/2
        Behavior on x{NumberAnimation{duration: 200}}
        Behavior on y{NumberAnimation{duration: 200}}

        isDragActive: true

        onMRelease: {
            const status = Util.isContain(body_exam1, sun, centerDropArea, 0);
            if(status !== ''){
                sunLight()
            }
            else{
                reset()
                animateIncorrect()
            }

        }

        Component.onCompleted: objList.push(sun)

    }

    //-- lighting --//
    Image{
        id: img_light

        visible: false

        anchors.centerIn: parent
        source: "qrc:/Content/Images/Exams/exam_notRealIcekream/light.png"
        sourceSize.width: parent.width * 1
        fillMode: Image.PreserveAspectFit

        opacity: 0.2

        SequentialAnimation{
            id: animateLight
            running: true
            loops: Animation.Infinite

            NumberAnimation {
                target: img_light
                property: "opacity"; from: 0.2; to: 0.8
                duration: 1000
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: img_light
                property: "opacity"; from: 0.8; to: 0.2
                duration: 1000
                easing.type: Easing.InOutQuad
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

    Timer{
        id: timer_sunlight
        interval: 1000
        onTriggered:{
            iceKream4.isCorrect = true
            isSunlight = true
        }
    }

    //-- sunLight --//
    function sunLight(){

        sun.x = body_exam1.width/2 - sun.width/2
        sun.y = body_exam1.height/2 - sun.height/2
        img_light.visible = true
        print("done!")
        timer_sunlight.restart()

    }

    //-- reset state --//
    function reset(){
        for(var i=0; i< objList.length; i++){
            objList[i].reset()
        }
        img_light.visible = false
    }

}

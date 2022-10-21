import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import '../Utils'
import '../Utils/Utils.js' as Util

Item {
    id: body_exam1

    property alias pressItem: pressAnimItem

    property int slice_w: body_exam1.width * 0.1
    property int slice_h: body_exam1.height * 0.1

    //-- show item border --//
    property bool isBorderShow: false

    property var snowballs: []

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
                text: "بزرگترین گلوله برفی رو پیدا کن"
            }
        }


        //-- images --//
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


                //-- snowball 1 --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: snowball_1

                        signal reset()
                        onReset: {
                            x = 0
                            y = parent.height/2 - height/2
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 3

                        source: "qrc:/Content/Images/Exams/exam_biggestSnowball/snowball.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        y: parent.height/2 - height/2

                        Behavior on scale {NumberAnimation{duration: 200}}

                        isDragActive: true

                        Component.onCompleted: snowballs.push(snowball_1)

                        isCorrect: false
                        onCorrectSelected: done.animate()

                        onMRelease: {

                            checkAllItem(snowball_1)

                        }
                    }
                }

                //-- snowball 2 --//
                Rectangle{
                    Layout.row: 0
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: snowball_2

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = 0
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 2

                        source: "qrc:/Content/Images/Exams/exam_biggestSnowball/snowball.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2

                        isDragActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: snowballs.push(snowball_2)


                        onMRelease: {

                            checkAllItem(snowball_2)
                        }
                    }
                }

                //-- snowball 3 --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: snowball_3

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height - height
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 1.5

                        source: "qrc:/Content/Images/Exams/exam_biggestSnowball/snowball.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height - height

                        isDragActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: snowballs.push(snowball_3)

                        onMRelease: {

                            checkAllItem(snowball_3)
                        }
                    }
                }

                //-- snowball 4 --//
                Rectangle{
                    Layout.row: 1
                    Layout.column: 1
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "transparent"
                    border.width: isBorderShow ? 1 : 0

                    ImageObject{
                        id: snowball_4

                        signal reset()
                        onReset: {
                            x = parent.width/2 - width/2
                            y = parent.height/2 - height/2
                            scale = 1.0
                            visible = true
                        }

                        property real sizeRatio: 2.5

                        source: "qrc:/Content/Images/Exams/exam_biggestSnowball/snowball.png"

                        sourceSize.width: slice_w * sizeRatio
                        fillMode: Image.PreserveAspectFit
                        x: parent.width/2 - width/2
                        y: parent.height/2 - height/2

                        isDragActive: true

                        Behavior on scale {NumberAnimation{duration: 200}}

                        Component.onCompleted: snowballs.push(snowball_4)

                        onMRelease: {

                            checkAllItem(snowball_4)
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

    Connections{
        target: root

        onResetGameState: {
            reset()
        }
    }

    //-- reset state --//
    function reset(){
        for(var i=0; i< snowballs.length; i++){
            snowballs[i].reset()
        }
    }


    //-- check final condition --//
    function checkFinalCondition(){

        var visibleItemCount = 0;
        for(var i=0; i< snowballs.length; i++){
            if(snowballs[i].visible) visibleItemCount++;
        }
        if(visibleItemCount >1) return false;

        snowball_1.isCorrect = true
        return true

    }

    //-- check draged item vs other 3 item --//
    function checkAllItem(dragItem){

        for(var i=0; i< snowballs.length; i++){

            if(snowballs[i] != dragItem){

                if(snowballs[i].visible){
                    const status = Util.isContain(body_exam1, dragItem, snowballs[i], 20);
                    if(status === 'DES_IN_SRC'){
                        snowballs[i].visible = false
                        dragItem.scale += 0.1
                        checkFinalCondition()
                        return;
                    }
                    else if(status === 'SRC_IN_DES'){
                        dragItem.visible = false
                        snowballs[i].scale += 0.1
                        checkFinalCondition()
                        return;
                    }
                }
            }
        }
    }

}

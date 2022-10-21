import QtQuick 2.0
import QtQuick.Controls 2.4
import QtMultimedia 5.9

Rectangle{
    id: done

    signal animate()
    onAnimate: {
        visible = true
        root.ringFinish()
        anim_done.restart()
    }

    visible: false
    anchors.fill: parent
    color: "#ddFFFFFF"

    Rectangle{
        id: done_win

        width: parent.width * 0.7
        height: parent.height * 0.4
        anchors.centerIn: parent

        border.width: 10
        radius: 20

        Label{
            text: "تبریک می گم"
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }


    ParallelAnimation{
        id: anim_done

        NumberAnimation {
            target: done_win
            property: "scale"; from: 0.1; to: 1.0
            duration: 300
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: done_win
            property: "opacity"; from: 0.1; to: 1.0
            duration: 100
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: done
            property: "opacity"; from: 0.1; to: 1.0
            duration: 80
            easing.type: Easing.InOutQuad
        }
    }

    MouseArea{
        anchors.fill: parent

        onClicked: done.visible = false
    }
}


import QtQuick 2.0

Rectangle{
    id: pressAnimItem

    property int originX: 0
    property int originY: 0

    width: 200
    height: 200
    x: originX - (width/2)
    y: originY - (height/2)
    radius: width * 0.5
    color: "#33000000"
    opacity: 0.0

    signal animate(int posX, int posY)
    onAnimate: {
        pressAnimItem.originX = posX
        pressAnimItem.originY = posY
        pressAnim.restart()
    }

    ParallelAnimation{
        id: pressAnim

        NumberAnimation {
            target: pressAnimItem
            property: "scale"; from: 0.1; to: 1.0
            duration: 500
            easing.type: Easing.InOutQuad
        }
        SequentialAnimation{

            NumberAnimation {
                target: pressAnimItem
                property: "opacity"; from: 0.9; to: 0.1
                duration: 490
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: pressAnimItem
                property: "opacity"; from: 0.1; to: 0.0
                duration: 10
                easing.type: Easing.InOutQuad
            }
        }
    }
}

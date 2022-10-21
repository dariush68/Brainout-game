import QtQuick 2.0


Image {
    id: img_txt

    property alias num: txt_input.text

    source: "qrc:/Content/Images/Util/input.png"
    sourceSize.height: parent.height * 0.8
    fillMode: Image.PreserveAspectFit
    anchors.centerIn: parent

    TextInput{
        id: txt_input
        width: parent.width
        height: parent.height
        font.pixelSize: 32
        font.family: dastnevis.name
        verticalAlignment: TextInput.AlignVCenter
        horizontalAlignment: TextInput.AlignHCenter
        text: ""
    }
}

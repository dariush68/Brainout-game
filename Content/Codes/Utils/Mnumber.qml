import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

    Item {
    anchors.fill: parent

    property alias num: lbl_num.num
    property int itmHeigh: img_btn_minus.implicitHeight

    RowLayout{
        anchors.fill: parent

        Item{Layout.fillWidth: true}

        //-- - --//
        ImageObject{
            id: img_btn_minus

            source: "qrc:/Content/Images/Util/decrease.png"

            sourceSize.width: slice_w * 0.9
            fillMode: Image.PreserveAspectFit
            isVerifyActive: false
            isShowBorder: false

            onMClick: {
                lbl_num.num = lbl_num.num > 0 ? lbl_num.num-1 : 0
            }

        }

        //-- number --//
        Item{
            Layout.preferredWidth: lbl_num.contentHeight * 1.4

            Label{
                id: lbl_num

                property int num: 0

                text: num
                font.pixelSize: 50
                font.bold: true
                anchors.centerIn: parent
            }
        }

        //-- + --//
        ImageObject{
            id: img_btn_plus

            source: "qrc:/Content/Images/Util/increase.png"

            sourceSize.width: slice_w * 0.9
            fillMode: Image.PreserveAspectFit
            isVerifyActive: false
            isShowBorder: false

            onMClick: {
                lbl_num.num += 1
            }

        }

        Item{Layout.fillWidth: true}
    }
}

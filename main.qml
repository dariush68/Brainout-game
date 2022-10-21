import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtMultimedia 5.9

import 'Content/Codes/Exams'
import 'Content/Codes/Utils'

Window {
    id: root

    signal resetGameState()

    signal ringCorrect()
    onRingCorrect: {
        audioCorrect.play()
    }

    signal ringInCorrect()
    onRingInCorrect: {
        audioInCorrect.play()
    }

    signal ringFinish()
    onRingFinish: {
        audioFinish.play()
    }

    width: 378 //540
    height: 672 //960
    visible: true
    title: qsTr("Hello World")


    FontLoader{ id: dastnevis; source: "qrc:/Content/Fonts/danstevis.otf"}   //  farsi Number Font

    Pane{

        anchors.fill: parent

        font.family: "Dast Nevis"
        font.pixelSize: 28
        padding: 0


        ColumnLayout{
            anchors.fill: parent

            //-- header --//
            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                color: "red"
            }

            //-- body --//
            SwipeView{
                id: view

                Layout.fillWidth: true
                Layout.fillHeight: true
//                color: "#00ffffff"

                currentIndex: 0

                Exam_girrafiIntoFridge{
                    id: body_girrafiIntoFridge
                }

                Exam_canEatMeat{
                    id: body_canEatMeat
                }

                Exam_triangleInPentagram{
                    id: body_triangleInPentagram
                }

                Exam_doNotTap{
                    id: body_doNotTap

                    isActive: view.currentIndex === 3

                }

                Exam_ducklingDrink{
                    id: body_ducklingDrink
                }

                Exam_numberOfHairs{
                    id: body_numberOfHairs
                }

                Exam_darkestColor{
                    id: body_darkestColor
                }

                Exam_canNotEaten{
                    id: body_canNotEaten
                }

                Exam_notRealIcekream{
                    id: body_notRealIcekream
                }

                Exam_wakeupOwl{
                    id: body_wakeupOwl
                }

                Exam_sledPark{
                    id: body_sledPark
                }

                Exam_biggestSnowball{
                    id: body_biggestSnowball
                }

                ExamSelect{
                    id: body_exam1
                }

                Exam_2{
                    id: body_exam2
                }

                Exam_3{
                    id: body_exam3
                }

                Exam_4{
                    id: body_exam4
//                    visible: false
//                    anchors.fill: parent
                }

                Exam_5{
                    id: body_exam5
//                    anchors.fill: parent
                }

            }

            PageIndicator {
                id: indicator

                count: view.count
                currentIndex: view.currentIndex

//                anchors.bottom: view.bottom
//                anchors.horizontalCenter: parent.horizontalCenter

                Layout.alignment: Qt.AlignBottom |  Qt.AlignHCenter

            }

            //-- header --//
            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 70
                color: "green"


                Button{
                    text: "reset"
                    onClicked: {
                        resetGameState()
                    }
                }
            }
        }
    }

    Audio {
        id: playMusic
        source: "qrc:/Content/music/Spooky-Island.mp3"
//        autoPlay: true
    }

    Audio {
        id: audioCorrect
        source: "qrc:/Content/music/SuccessDing.m4a"
    }

    Audio {
        id: audioInCorrect
        source: "qrc:/Content/music/BuzzerError.m4a"
    }


    Audio {
        id: audioFinish
        source: "qrc:/Content/music/Clapping.m4a"
    }
}

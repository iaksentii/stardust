import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.3

Rectangle {
    visible: true
    anchors.fill: parent
    color: "transparent"

    property alias sourceName:loader


    MouseArea {
        anchors.fill: parent
        onClicked: {

        }
    }
//    Rectangle {
//        id: loaderWindow
//        width: loader.width + 2
//        height: loader.height + 2
//        anchors.centerIn: parent
//        border.color: "white"

        Loader {
            id: loader
            anchors.centerIn: parent

        }
        BusyIndicator {
            id: indicator
                   running: !loader.item
                   anchors.centerIn: parent
               }

    DropShadow {
        id: rectShadow
        anchors.fill: loaderWindow
        cached: true
        horizontalOffset: -7
        verticalOffset: 7
        spread: 0.0
        radius: 24
        samples: 16;
        color: "#80000000"
        smooth: true
        source: loaderWindow
    }
}


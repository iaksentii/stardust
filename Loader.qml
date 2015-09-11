import QtQuick 2.0

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

    Loader {
        id: loader
        anchors.centerIn: parent
    }
}


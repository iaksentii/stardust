import QtQuick 2.3

Rectangle {
    id: main

    Image {
        anchors.centerIn: parent
        source: "qrc:/Images/PageNotFound.png"

        Rectangle {
            width: 100
            height: 50

            color: "lightblue"

            Text {
                text: "Close"
                font.pixelSize: 20
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.closeWindow()
                }
            }
        }

    }

}


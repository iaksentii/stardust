import QtQuick 2.3

Rectangle {
    id: emptyPage
    property string screen: "emptyPage"
    Image {
        anchors.centerIn: parent
        source:graphicEngine.get("PageNotFound.png",screen)

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


import QtQuick 2.0
import "styles"
Rectangle {
    id: notification
    width: 400
    height: 400

    property alias button: button
    property alias text: text.text
    property alias size: text.font.pointSize
    property alias buttonArea: area

    anchors.centerIn: parent
    border.width: 3
    border.color: "#21a89f"
    color: "#43d3ca"
    opacity: 0.7

    TextLabel{
        id: text
        anchors.centerIn: parent
        font.pointSize: 16
        color: "black"
    }
    MouseArea{
        id: area
        anchors.fill: parent
    }
    Row{
        spacing :10
    Button{
        //buttonArea.onClicked:
        id: button
        width: 100
        size: 10
    }
    Button{
        text: qsTr("Quit")
      size: 10
        width: 100
     buttonArea.onClicked: ScreenManager.closeWindow()
    }
    }
}


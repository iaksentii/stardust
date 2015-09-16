import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import "styles"

Rectangle {
    property alias okArea: okMouseArea
    property alias cancelArea: cancelMouseArea
    property TextInput planetName: planetName
    property Image planetImage: planetImage

    id: newWindow
    color: "#21a89f"
    border.width: 10
    border.color: "#21a89f"

    MouseArea {
        anchors.fill: newWindow
    }

    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        width: parent.width/3.5
        height: parent.height/7
        text:  qsTr("Cancel")

        MouseArea {
            id: cancelMouseArea
            anchors.fill: parent
        }
    }

    Button {
        id: okButton
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        width: parent.width/3.5
        height: parent.height/7
        text: qsTr("Ok")


        MouseArea {
            id: okMouseArea
            anchors.fill: parent
        }
    }

    Rectangle {

        id: planetNameSlot
        color: "transparent"
        width: 187
        height: 32
        border.width: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10

        TextInput {
            id: planetName

            anchors.fill: parent
            maximumLength: 10

            focus: true
            cursorVisible: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 21
        }
    }

    Image {

        id: planetImage
        anchors.top: planetNameSlot.bottom
        anchors.centerIn: parent
        height: 50
        width: 50
    }

//    Column {

//        spacing: 2
//        id:

//    }
}

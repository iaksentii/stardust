import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import "styles"

Rectangle {
    property alias okArea: okMouseArea
    property alias cancelArea: cancelMouseArea
    property TextInput planetName: planetName

    id: newWindow
    color: "#feda78"
    radius: 3

    MouseArea {
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: newWindow
    }

    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left

        width: parent.width/4
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

        width: parent.width/4
        height: parent.height/7
        text: qsTr("Ok")


        MouseArea {
            id: okMouseArea
            anchors.fill: parent
        }
    }

    Rectangle {

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

//    Image {

//    }
}

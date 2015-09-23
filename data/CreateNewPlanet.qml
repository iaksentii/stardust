import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import "styles"

Rectangle {
    property alias okArea: okMouseArea
    property alias cancelArea: cancelMouseArea
    property alias part1: part1
    property alias part2: part2
    property alias part3: part3
    property alias chooseType: planetType
    property TextInput planetName: planetName
    property Image planetImage: planetImg
    property string screenName: "playField"
    property int part: -1
    property string currentTag: ""
    property var planetTag :["add", "add", "add", "add",
                             "add", "add", "add", "add"]
    property var sunSource: ["1.png", "2.png", "3.png"]
    property int planetNumber: -1

    id: newWindow
    color: "#21a89f"
    border.width: 10
    border.color: "#43d3ca"

    MouseArea {
        anchors.fill: newWindow
    }

    Button {
        id: cancelButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.border.width
        anchors.left: parent.left
        anchors.leftMargin: parent.border.width

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
        anchors.bottomMargin: parent.border.width
        anchors.right: parent.right
        anchors.rightMargin: parent.border.width

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
        color: "#43d3ca"
        width: 187
        height: 32
        border.width: 2
        border.color: "#21a89f"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10

        TextInput {
            id: planetName

            anchors.fill: parent
            maximumLength: 10

            focus: true
            cursorVisible: false
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 21
        }
    }

    Image {

        id: planetImg
        anchors.left: parent.left
        anchors.leftMargin: 2 * parent.border.width
        anchors.top: planetNameSlot.bottom
        anchors.topMargin: 2 * parent.border.width
        height: 200
        width: 200
    }

    Column {

        id: planetsPart
        spacing: 2
        anchors.right: parent.right
        anchors.rightMargin: parent.border.width
        anchors.top: planetNameSlot.bottom
        anchors.topMargin: 10
        anchors.bottom: okButton.top
        anchors.bottomMargin: 10
        height: parent.height - planetNameSlot.y
        width: height/3

        Rectangle {
            id: part1
            border.color: "#43d3ca";
            border.width: 1;
            height: parent.height/3
            color: "#f56a82"
            width: parent.width

            MouseArea {
                id: part1Area
                anchors.fill: parent

                onClicked: {
                    part = 1
                    currentTag = "1"
                    planetImg.source = galaxyEngine.get(sunSource[0], screenName)
                }
            }
        }
        Rectangle {
            id: part2
            border.color: "#43d3ca";
            border.width: 1;
            height: parent.height/3
            color: "#72ffb3"
            width: parent.width

            MouseArea {
                id: part2Area
                anchors.fill: parent
                onClicked: {
                    part = 2
                    currentTag = "2"
                    planetImg.source = galaxyEngine.get(sunSource[1], screenName)
                }
            }
        }
        Rectangle {
            id: part3
            border.color: "#43d3ca";
            border.width: 1;
            height: parent.height/3
            color: "#fafa78"
            width: parent.width

            MouseArea {
                id: part3Area
                anchors.fill: parent
                onClicked: {
                    part = 3
                    currentTag = "3"
                    planetImg.source = galaxyEngine.get(sunSource[2], screenName)
                }
            }
        }
    }

    Rectangle {
        id: planetType
        anchors.fill: parent
        color: "#21a89f"
        border.width: 10
        border.color: "#43d3ca"
        visible: true

        Column {
            anchors.centerIn: parent
            Image {
                id: sun
                source: galaxyEngine.get("sun.png", screenName)
                height: 200
                width: 200

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        planetType.visible = false
                    }
                }
            }
        }
    }
}

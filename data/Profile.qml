import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.1
import QtQuick.Controls.Private 1.0
import QtMultimedia 5.0
import "styles"


Rectangle {
    id: profiles

    property string screen: "profiles"
    property int space: 4

    width: 500
    height: 600

    border.width: 10
    border.color: "#21a89f"

    Image {
        id:profilesBG

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        source: graphicEngine.get("options.jpg","options")
    }

    FastBlur {
        anchors.fill: profiles

        source: profilesBG
        radius: 32

    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 70

        TextLabel{
            anchors.centerIn: parent
            text: "RETURN"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: ScreenManager.closeWindow()
        }
    }

    Rectangle {
        id: inputAreaRect

        x: 100
        y: 150

        width: 200
        height: 60

        color: "#43d3ca"
        border.width: 3
        border.color: "#21a89f"
        opacity: 0.7

        TextInput {
            id: inputArea
            font.pixelSize: 28;
            anchors.fill: parent

            maximumLength: 12

            text:""
        }

    }

    Button {
        id: newBtn

        x: inputAreaRect.x + inputAreaRect.width + space
        y: inputAreaRect.y

        width: 100 - space

        TextLabel{
            anchors.centerIn: parent
            font.pointSize: 12
            text: "NEW"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                profileManager.newPlayer(inputArea.text);
                inputArea.text = "";
            }
        }
    }

    Rectangle {
        id: playersListRect

        x: 100
        y: inputAreaRect.y + inputAreaRect.height + space

        width: 200
        height: delBtn.height + loadBtn.height + space

        color: "#43d3ca"
        border.width: 3
        border.color: "#21a89f"
        opacity: 0.7

        ListView {
            id: playersList

            anchors.fill: parent

            highlight: Rectangle {
                width: playersListRect.width

                radius: 5
                opacity: 0.7
            }

            model: profileManager.playersListModel
            delegate: TextLabel {
                x: 5
                text: display

                MouseArea {
                    anchors.fill: parent
                    onClicked: playersList.currentIndex = model.index
                }
            }
        }
    }

    Button {
        id: delBtn

        x: playersListRect.x + playersListRect.width + space
        y: playersListRect.y

        width: 100 - space

        TextLabel{
            anchors.centerIn: parent
            font.pointSize: 12
            text: "DELETE"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: profileManager.deletePlayer(playersList.currentItem.text)
        }
    }

    Button {
        id: loadBtn

        x: delBtn.x
        y: delBtn.y + delBtn.height + space

        width: delBtn.width

        TextLabel{
            anchors.centerIn: parent
            font.pointSize: 12
            text: "LOAD"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

                profileManager.loadPlayer(playersList.currentItem.text)
                profileManager.currentPlayerData.set("score", "666")
            }
        }
    }

    TextLabel {
        id: captioncurrentPlayer

        x: loadBtn.x
        y: loadBtn.y + loadBtn.height + space

        font.pointSize: 12
        text: profileManager.currentPlayer()

    }

    Connections {
        target: profileManager
        onCurrentPlayerIndexChanged: {
            captioncurrentPlayer.text = profileManager.currentPlayer() + "  " + profileManager.currentPlayerData.get("score");
            playersList.currentIndex = index;
        }
    }

}



import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import "styles"

Rectangle {
    id: mainMenu

    height: parent.parent.height
    width: parent.parent.width

    color: "black"

    visible: true

    property string screen: "mainWindow"
    property string playerName: profileManager.hasPlayers ? profileManager.currentPlayer() : ""
    property string playerScore: profileManager.hasPlayers ? profileManager.currentPlayerData.get("score") : ""


    Image {
        source: graphicEngine.get("Background.jpg",screen)
    }

    Row {
        x: 50
        y: 50

        spacing: 15

       Image {
            height: 200
            width: 200
            source: graphicEngine.get("playerIcon.png",screen)
        }

        Text {
            id: profileStatus
            font.pixelSize: 25
            text: qsTr("Profile") + ":\n" + mainMenu.playerName  + "\n" + mainMenu.playerScore
            color: "white"
        }

        Connections {
            target: profileManager
            onCurrentPlayerDataChanged: {
                mainMenu.playerName = profileManager.hasPlayers ? profileManager.currentPlayer() : ""
                mainMenu.playerScore = profileManager.hasPlayers ? profileManager.currentPlayerData.get("score") : ""

            }
        }
    }



    Column {
        spacing: 20

        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.verticalCenter: parent.verticalCenter

        Button {
            text: qsTr("START GAME")
            buttonArea.onClicked: {
                ScreenManager.loadWindow("StartGame")
            }
        }
        Button {
            text: qsTr("HANDBOOK")
            buttonArea.onClicked: {
                ScreenManager.loadWindow("FFFF")
            }
        }
        Button {
            text: qsTr("PROFILE")
            buttonArea.onClicked: {
                ScreenManager.loadWindow("Profile")
            }
        }
        Button {
            text: qsTr("OPTIONS")
            buttonArea.onClicked: {
                ScreenManager.loadWindow("Options")
            }
        }
        Button {
            text: qsTr("MORE INFO")
            buttonArea.onClicked: {
                ScreenManager.loadWindow("MoreInfo")
            }
        }
        Button {
                text: "MATCH3"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("Match3")
                }
        }
        Button {
            text: qsTr("QUIT")
            buttonArea.onClicked: {
                Qt.quit()
            }
        }

    }

}

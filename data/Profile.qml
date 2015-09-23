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

    property string checkedPlayer

    property string screen: "profiles"
    property int space: 4
    property int workWidth: 340

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

    Column {
        spacing: space
        anchors.horizontalCenter: parent.horizontalCenter
        y: 70

        Button {
            width: workWidth

            text: qsTr("RETURN")
            buttonArea.onClicked: ScreenManager.closeWindow()
        }

        Button {
            width: workWidth

            text: qsTr("NEW PLAYER")
            buttonArea.onClicked: ScreenManager.loadWindow("NewPlayer")
        }

        Row {
            spacing: space

            Column {
                spacing: space

                Rectangle {
                    id: playersListRect

                    width: 220
                    height: 300

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
            }

            Column {
                spacing: space

                Button {
                    width: workWidth - playersList.width - space

                    text: qsTr("DELETE")
                    buttonArea.onClicked: profileManager.deletePlayer(playersList.currentItem.text)
                }

                Button {
                    width: workWidth - playersList.width - space

                    text: qsTr("LOAD")
                    buttonArea.onClicked: {
                        profileManager.passwordCtrl.checkedPlayer = playersList.currentItem.text;
                        ScreenManager.loadWindow("PasswordChecking");
                    }
                }
            }
        }
    }

    Connections {
        target: profileManager
        onCurrentPlayerIndexChanged: playersList.currentIndex = index
    }
}



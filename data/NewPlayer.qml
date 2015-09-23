import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.1
import QtQuick.Controls.Private 1.0
import QtMultimedia 5.0
import "styles"


Rectangle {
    id: newPlayer

    property string screen: "newPlayer"
    property int space: 4

    width: 500
    height: 400

    border.width: 10
    border.color: "#21a89f"

    Image {
        id:profilesBG

        anchors.fill: parent
        source: graphicEngine.get("background.jpg",screen)
    }


    Column {
        spacing: space
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20

        Button {
            text: qsTr("RETURN")

            visible: profileManager.hasPlayers

            anchors.horizontalCenter: parent.horizontalCenter
            buttonArea.onClicked: ScreenManager.closeWindow()
        }

        Row {
            spacing: space
            anchors.right: parent.right
            anchors.rightMargin: 30


            TextLabel {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Player name")
            }

            Rectangle {
                id: inputAreaRect

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
        }

        Row {
            spacing: space
            anchors.right: parent.right
            anchors.rightMargin: 30


            TextLabel {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Password")
            }

            Rectangle {
                id: passwordRect

                width: 200
                height: 60

                color: "#43d3ca"
                border.width: 3
                border.color: "#21a89f"
                opacity: 0.7

                TextInput {
                    id: passwordInput

                    echoMode: TextInput.Password

                    font.pixelSize: 28;
                    anchors.fill: parent

                    maximumLength: 12

                    text:""
                }

            }
        }

        Row {
            spacing: space
            anchors.right: parent.right
            anchors.rightMargin: 30


            TextLabel {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Repeat password")
            }

            Rectangle {
                id: repeatPasswordRect

                width: 200
                height: 60

                color: "#43d3ca"
                border.width: 3
                border.color: "#21a89f"
                opacity: 0.7

                TextInput {
                    id: repeatPasswordInput

                    echoMode: TextInput.Password

                    font.pixelSize: 28;
                    anchors.fill: parent

                    maximumLength: 12

                    text:""
                }

            }
        }

        Button {
            text: qsTr("ACCEPT")
            anchors.horizontalCenter: parent.horizontalCenter
            buttonArea.onClicked: {
                if (passwordInput.text === repeatPasswordInput.text) {
                    profileManager.newPlayer(inputArea.text, passwordInput.text)
                    ScreenManager.closeWindow();
                }
                else {
                    passwordInput.text = ""
                    repeatPasswordInput.text = ""
                }
            }
        }
    }
}


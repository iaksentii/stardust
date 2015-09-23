import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.1
import QtQuick.Controls.Private 1.0
import QtMultimedia 5.0
import "styles"


Rectangle {
    id: passwordChecking

    property string screen: "passwordChecking"
    property int space: 4

    width: 500
    height: 300


    border.width: 10
    border.color: "#21a89f"

    Image {
        id:profilesBG

        anchors.fill: parent
        source: graphicEngine.get("background.jpg",screen)
    }

    Column {
        spacing:  space
        anchors.horizontalCenter: parent.horizontalCenter
        y: 70

        Button {
            text: qsTr("RETURN")
            buttonArea.onClicked: ScreenManager.closeWindow()
        }

        Row {
            spacing: space

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

            Button {
                width: 100 - space

                text: qsTr("ACCEPT")
                buttonArea.onClicked: {
                    if (profileManager.passwordCtrl.confirmPassword(passwordInput.text)) {
                        profileManager.loadPlayer(profileManager.passwordCtrl.checkedPlayer)
                    }

                    ScreenManager.closeWindow();
                }
            }
        }
    }
}



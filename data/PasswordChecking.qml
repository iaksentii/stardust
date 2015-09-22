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

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        source: graphicEngine.get("background.jpeg",screen)
    }

    FastBlur {
        anchors.fill: passwordChecking

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
        id: passwordRect

        x: 100
        y: 150

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
        id: acceptBtn

        x: passwordRect.x + passwordRect.width + space
        y: passwordRect.y

        width: 100 - space

        TextLabel{
            anchors.centerIn: parent
            font.pointSize: 12
            text: "ACCEPT"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (profileManager.confirmPassword(passwordInput.text)) {
                    profileManager.loadPlayer(profileManager.checkedPlayer)
                }

                ScreenManager.closeWindow();
            }
        }
    }



}



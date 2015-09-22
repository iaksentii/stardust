import QtQuick 2.0

Rectangle {
    id: menuBar

    property Button handBook: handbookButton
    x: main.width - 10
    y: 0
    anchors.topMargin: 100
    height: parent.height
    color: "#21a89f"
    border.width: 10
    border.color: "#21a89f"
    width: 100

    MouseArea {
        hoverEnabled: true
        anchors.fill: menuBar
        onEntered: {
            slideLeft.running = true
        }
        onExited: {
            slideRight.running = true
        }
    }

    Button {
        id: handbookButton
        height: 50
        width: 90
        anchors.bottom: profileButton.top
        size: 10
        text: "HANDBOOK"

         buttonArea.onClicked: ScreenManager.loadWindow("FFFF")
    }

    Button {
        id: profileButton
        height: 50
        width: 90
        anchors.bottom: optionsButton.top
        size: 10
        text: "PROFILE"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ScreenManager.loadWindow("Profile")
            }
        }
    }
    Button {
        id: optionsButton
        height: 50
        width: 90
        anchors.bottom: infoButton.top
        size: 10
        text: "OPTIONS"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ScreenManager.loadWindow("Options")
            }
        }
    }
    Button {
        id: infoButton
        height: 50
        width: 90
        anchors.bottom: guitButton.top
        size: 10
        text: "MORE INFO"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                ScreenManager.loadWindow("MoreInfo")
            }
        }
    }

    Button {
        id: guitButton
        height: 50
        width: 90
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: "QUIT"
        size: 10

        MouseArea {
            anchors.fill: guitButton
            onClicked: {
                ScreenManager.closeWindow();
            }
        }
    }


    NumberAnimation {
        id: slideLeft
        target: menuBar;
        duration: 400;
        property: "x";
        from: main.width - 10
        to: main.width - menuBar.width
    }


    NumberAnimation {
        id: slideRight
        target: menuBar;
        duration: 400;
        property: "x";
        from: main.width - menuBar.width
        to: main.width - 10
    }
}

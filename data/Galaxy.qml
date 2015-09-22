import QtQuick 2.0
import galaxy.engine 1.0
import QtQuick.Controls 1.2
import "styles"

Item {
    property string screenName: "playField"

    id: mainWindow
    visible: true
    height: 1024
    width: 1280

    Image {
        id: background
        anchors.fill: parent
        source: galaxyEngine.get("background.jpg", screenName)
    }

    Image {
        height: 50
        width: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        source: galaxyEngine.get("pr.png", screenName)

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                parent.height = 60
                parent.width = 60
            }
            onExited: {
                parent.height = 50
                parent.width = 50
            }
        }
    }

    Image {
        height: 50
        width: 50
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        source: galaxyEngine.get("nx.png", screenName)

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                parent.height = 60
                parent.width = 60
            }
            onExited: {
                parent.height = 50
                parent.width = 50
            }
        }
    }

    Timer {
        id: timer
        interval: 6000; running: true; repeat: true
        onTriggered: {
            galaxyEngine.addResourses();
        }
    }

    GalaxyEngine {
        id: galaxyEngine
    }

    SolarSystem {
        id: system1

        anchors.centerIn: parent
        width: mainWindow.width - mainWindow.width/3
        height: mainWindow.height - mainWindow.height/2
    }

//    SolarSystem {
//        id: system2
//        anchors.centerIn: parent
//        width: mainWindow.width - mainWindow.width/3
//        height: mainWindow.height - mainWindow.height/2
//        visible: false
//    }

//    SolarSystem {
//        id: system3
//        anchors.centerIn: parent
//        width: mainWindow.width - mainWindow.width/3
//        height: mainWindow.height - mainWindow.height/2
//        visible: false
//    }

    Rectangle {
        id: menuBar
        x: mainWindow.width - 10
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
            text: qsTr("HANDBOOK")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("FFFF")
                }
            }
        }
        Button {
            id: profileButton
            height: 50
            width: 90
            anchors.bottom: optionsButton.top
            size: 10
            text: qsTr("PROFILE")

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
            text: qsTr("OPTIONS")

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
            text: qsTr("MORE INFO")

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
            text: qsTr("QUIT")
            size: 10

            MouseArea {
                anchors.fill: guitButton
                onClicked: {
                    Qt.quit()
                }
            }
        }

        NumberAnimation {
            id: slideLeft
            target: menuBar;
            duration: 400;
            property: "x";
            from: mainWindow.width - 10
            to: mainWindow.width - menuBar.width
        }


        NumberAnimation {
            id: slideRight
            target: menuBar;
            duration: 400;
            property: "x";
            from: mainWindow.width - menuBar.width
            to: mainWindow.width - 10
        }
    }

    Row {
        property alias resource1Count: resource1Count
        property alias resource2Count: resource2Count
        property alias resource3Count: resource3Count
        property alias resource4Count: resource4Count
        property alias resource5Count: resource5Count

        id: resourceBar
        width: 600
        height: 60
        anchors.top: parent.top
        spacing: 2

        ParallelAnimation {
            id: slideTopDown
            loops: 3

            NumberAnimation {
                id: slideDown
                duration: 400;
                property: "y";
            }
            NumberAnimation {
                id: slideTop
                duration: 400;
                property: "y";
            }
        }

        Rectangle {
            property alias resource1Count : resource1Count
            id: resource1
            color: "#f56a82";
            opacity: 0.7
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: resource1Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource1.toString())
                color: "black";
            }

            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource2Count : resource2Count
            id: resource2
            color: "#91D4FA";
            opacity: 0.7
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: resource2Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource2.toString())
                color: "black";
            }
            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource3Count : resource3Count
            id: resource3
            color: "#F7FA91";
            opacity: 0.7
            border.color: "white"
            border.width: 1
            height: parent.height
            width: parent.width/10

            Text {
                id: resource3Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource3.toString())
                color: "black";
            }

            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource4Count : resource4Count
            id: resource4
            color: "#919BFA"
            opacity: 0.7
            border.color: "white"
            border.width: 1
            height: parent.height
            width: parent.width/10

            Text {
                id: resource4Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource4.toString())
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource5Count : resource5Count
            id: resource5
            color: "#66FFCC"
            opacity: 0.7
            border.color: "white"
            border.width: 1
            height: parent.height
            width: parent.width/10

            Text {
                id: resource5Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource5.toString())
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
            }
        }
    }
    CreateNewPlanet {
        id: newPlanetWindow

        height: 400
        width: 400
        visible: false


        okArea.onClicked:  {
            newPlanetWindow.visible = false

            switch (newPlanetWindow.part) {
            case 1:
                if(galaxyEngine.resource1 >= 1) {
                    galaxyEngine.setPlanetsSlot(planetNumber, newPlanetWindow.planetImage.source)
                    galaxyEngine.resource1 -= 1
                }
                else {
                    slideDown.targets = [resource1]
                    slideDown.from = resource1.y - 20
                    slideDown.to = resource1.y + 20
                    slideTop.targets = [resource1]
                    slideTop.from = resource1.y + 20
                    slideTop.to = resource1.y

                    slideTopDown.running = true
                }

                break;
            case 2:
                if(galaxyEngine.resource2 >= 2 && galaxyEngine.resource1 >= 2) {
                    galaxyEngine.setPlanetsSlot(planetNumber, newPlanetWindow.planetImage.source)
                    galaxyEngine.resource1 -= 2
                    galaxyEngine.resource2 -= 2
                }
                else {
                    slideDown.targets = [resource1, resource2]
                    slideDown.from = resource1.y - 20
                    slideDown.to = resource1.y + 20
                    slideTop.targets = [resource1, resource2]
                    slideTop.from = resource1.y + 20
                    slideTop.to = resource1.y

                    slideTopDown.running = true
                }

                break;
            case 3:
                if(galaxyEngine.resource3 >= 1 && galaxyEngine.resource2 >= 2 && galaxyEngine.resource1 >= 2) {
                    galaxyEngine.setPlanetsSlot(planetNumber, newPlanetWindow.planetImage.source)
                    galaxyEngine.resource1 -= 2
                    galaxyEngine.resource2 -= 2
                    galaxyEngine.resource3 -= 1
                }
                else {
                    slideDown.targets = [resource1, resource2, resource3]
                    slideDown.from = resource1.y - 20
                    slideDown.to = resource1.y + 20
                    slideTop.targets = [resource1, resource2, resource3]
                    slideTop.from = resource1.y + 20
                    slideTop.to = resource1.y

                    slideTopDown.running = true
                }
                break;
            }

            galaxyEngine.setPlanetsName(system1.planetNumber, newPlanetWindow.planetName.text)
        }

        cancelArea.onClicked: {
            newPlanetWindow.visible = false
        }
    }
}

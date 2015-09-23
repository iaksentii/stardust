import QtQuick 2.0
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

    SolarSystem {
        id: system1

        anchors.centerIn: parent
        width: mainWindow.width - mainWindow.width/3
        height: mainWindow.height - mainWindow.height/2
    }

    SideBar {
        id: sideBar

        Button {
            id: profileButton
            height: 50
            width: 90
            anchors.bottom: sideBar.handBook.top
            size: 10
            text: "Match3"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("MATCH3")
                }
            }
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
            border.width: 3
            border.color: "#21a89f"
            color: "#43d3ca"
            opacity: 0.7
            height: parent.height
            width: parent.width/10

            Image {

                source: galaxyEngine.get("plazma.png", screenName)
                anchors.fill: parent

                Text {
                    id: resource1Count
                    anchors.bottom: parent.bottom
                    text: qsTr(galaxyEngine.resource1.toString())
                    color: "white";
                    font.bold: true
                    font.pixelSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                }
            }
        }
        Rectangle {
            property alias resource2Count : resource2Count
            id: resource2
            border.width: 3
            border.color: "#21a89f"
            color: "#43d3ca"
            opacity: 0.7
            height: parent.height
            width: parent.width/10

            Image {

                source: galaxyEngine.get("water.png", screenName)
                anchors.fill: parent

                Text {
                    id: resource2Count
                    anchors.bottom: parent.bottom
                    text: qsTr(galaxyEngine.resource2.toString())
                    color: "white";
                    font.bold: true
                    font.pixelSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                }
            }
        }
        Rectangle {
            property alias resource3Count : resource3Count
            id: resource3
            border.width: 3
            border.color: "#21a89f"
            color: "#43d3ca"
            opacity: 0.7
            height: parent.height
            width: parent.width/10

            Image {

                source: galaxyEngine.get("metal.png", screenName)
                anchors.fill: parent

                Text {
                    id: resource3Count
                    anchors.bottom: parent.bottom
                    text: qsTr(galaxyEngine.resource3.toString())
                    color: "white";
                    font.bold: true
                    font.pixelSize: 20
                }

                MouseArea {
                    anchors.fill: parent
                }
            }
        }
        Rectangle {
            property alias resource4Count : resource4Count
            id: resource4
            border.width: 3
            border.color: "#21a89f"
            color: "#43d3ca"
            opacity: 0.7
            height: parent.height
            width: parent.width/10

            Text {
                id: resource4Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource4.toString())
                color: "white"
                font.bold: true
                font.pixelSize: 20
            }
            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource5Count : resource5Count
            id: resource5
            border.width: 3
            border.color: "#21a89f"
            color: "#43d3ca"
            opacity: 0.7
            height: parent.height
            width: parent.width/10

            Text {
                id: resource5Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.resource5.toString())
                color: "white"
                font.bold: true
                font.pixelSize: 20
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
                    newPlanetWindow.planetTag[planetNumber] = "1"
                    galaxyEngine.resource1 -= 1
                }
                else {
                    slideDown.targets = [resource1]
                    slideDown.from = resource1.y - 20
                    slideDown.to = resource1.y + 20
                    slideTop.targets = [resource1]
                    slideTop.from = resource1.y + 20
                    slideTop.to = resource1.y

                    lackOfResources.visible = true
                    slideTopDown.running = true
                }

                break;
            case 2:
                if(galaxyEngine.resource2 >= 2 && galaxyEngine.resource1 >= 2) {
                    galaxyEngine.setPlanetsSlot(planetNumber, newPlanetWindow.planetImage.source)
                    newPlanetWindow.planetTag[planetNumber] = "2"
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

                    lackOfResources.visible = true
                    slideTopDown.running = true
                }

                break;
            case 3:
                if(galaxyEngine.resource3 >= 1 && galaxyEngine.resource2 >= 2 && galaxyEngine.resource1 >= 2) {
                    galaxyEngine.setPlanetsSlot(planetNumber, newPlanetWindow.planetImage.source)
                    newPlanetWindow.planetTag[planetNumber] = "3"
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

                    lackOfResources.visible = true
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

    Rectangle {

        id: lackOfResources
        anchors.centerIn: parent
        height: 200
        width: 400
        visible: false
        radius: 3
        border.width: 3
        border.color: "#21a89f"
        color: "#43d3ca"
        opacity: 0.7

        Text {
            anchors.centerIn: parent
            text: qsTr("You have not enough resources:(")
        }

        Button {
            id: okB

            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.border.width
            anchors.right: parent.right
            anchors.rightMargin: parent.border.width

            width: parent.width/3.5
            height: parent.height/7
            text: qsTr("Match3")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    lackOfResources.visible = false
                    ScreenManager.loadWindow("Match3")
                }
            }
        }

        Button {
            id: cancelB

            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.border.width
            anchors.left: parent.left
            anchors.leftMargin: parent.border.width

            width: parent.width/3
            height: parent.height/7
            text:  qsTr("Cancel")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    lackOfResources.visible = false
                }
            }

        }
    }
}

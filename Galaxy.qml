import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import galaxy.engine 1.0
import QtGraphicalEffects 1.0

Item {
    property string screenName: "playField"

    id: mainWindow
    visible: true
    height: 1024
    width: 1280

    Image {
        id: background
        anchors.fill: parent
        source: graphicEngine.get("background.jpg", screenName)
    }

    Image {
        height: 50
        width: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        source: graphicEngine.get("pr.png", screenName)

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                parent.height += 10
                parent.width += 10
            }
            onExited: {
                parent.height -= 10
                parent.width -= 10
            }
        }
    }

    Image {
        height: 50
        width: 50
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        source: graphicEngine.get("nx.png", screenName)

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                parent.height += 10
                parent.width += 10
            }
            onExited: {
                parent.height -= 10
                parent.width -= 10
            }
        }
    }

    Timer {
        id: timer
        interval: 60000; running: true; repeat: true
        onTriggered: {
            galaxyEngine.addResourses()
            resourceBar.resource1Count.text = qsTr(galaxyEngine.getResourcesCount(0).toString())
            resourceBar.resource2Count.text = qsTr(galaxyEngine.getResourcesCount(1).toString())
            resourceBar.resource3Count.text = qsTr(galaxyEngine.getResourcesCount(2).toString())
            resourceBar.resource4Count.text = qsTr(galaxyEngine.getResourcesCount(3).toString())
            resourceBar.resource5Count.text = qsTr(galaxyEngine.getResourcesCount(4).toString())
        }
    }

    GalaxyEngine {
        id: galaxyEngine
    }

    SolarSystem {
        id: system1

        Component.onCompleted: {
            system1.galaxyEngine = galaxyEngine
            system1.newPlanetWindow = newPlanetWindow
        }

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

    Rectangle{
        property alias menuItem: menuItem

        id: menuBar
        x: mainWindow.width - 10
        y: 0
        anchors.topMargin: 100
        height: parent.height
        color: "#feda78"
        width: 100
        radius: 2

        Item {
            id: menuItem
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

        Rectangle {
            property alias resource1Count : resource1Count
            id: resource1
            color: "transparent";
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: r1
                anchors.top: parent.top
                text: "1"
                color: "white";
            }
            Text {
                id: resource1Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.getResourcesCount(0).toString())
                color: "white";
            }

            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource2Count : resource2Count
            id: resource2
            color: "transparent";
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: r2
                anchors.top: parent.top
                text: "2"
                color: "white";
            }
            Text {
                id: resource2Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.getResourcesCount(1).toString())
                color: "white";
            }
            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource3Count : resource3Count
            id: resource3
            color: "transparent";
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: r3
                anchors.top: parent.top
                text: "3"
                color: "white";
            }
            Text {
                id: resource3Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.getResourcesCount(2).toString())
                color: "white";
            }

            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource4Count : resource4Count
            id: resource4
            color: "transparent";
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: r4
                anchors.top: parent.top
                text: "4"
                color: "white";
            }
            Text {
                id: resource4Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.getResourcesCount(3).toString())
                color: "white";
            }
            MouseArea {
                anchors.fill: parent
            }
        }
        Rectangle {
            property alias resource5Count : resource5Count
            id: resource5
            color: "transparent";
            border.color: "white";
            border.width: 1;
            height: parent.height
            width: parent.width/10

            Text {
                id: r5
                anchors.top: parent.top
                text: "5"
                color: "white";
            }
            Text {
                id: resource5Count
                anchors.bottom: parent.bottom
                text: qsTr(galaxyEngine.getResourcesCount(4).toString())
                color: "white";
            }
            MouseArea {
                anchors.fill: parent
            }
        }
    }
    CreateNewPlanet {
        id: newPlanetWindow

        height: 200
        width: 300
        visible: false

        okArea.onClicked:  {
            newPlanetWindow.visible = false
            galaxyEngine.setPlanetsName(system1.planetNumber, newPlanetWindow.planetName.text)
        }

        cancelArea.onClicked: {
            newPlanetWindow.visible = false;
            system1.isEmptySlot = false
        }
    }
}

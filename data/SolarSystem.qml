import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import galaxy.engine 1.0
import "sceneEngine.js" as Engine
import "."

Item {
    property Image currentPlanet: slot1
    property string screenName: "playField"
    property int planetNumber: -1

    id: solarSystem

    function setPlanetInfo() {

        newPlanetWindow.x = currentPlanet.x + planets.xCoords
        newPlanetWindow.y = currentPlanet.y + planets.yCoords + 3.5*currentPlanet.height

        newPlanetWindow.planetName.text = galaxyEngine.getPlanetsName(planetNumber)
        newPlanetWindow.planetImage.source = currentPlanet.source

        newPlanetWindow.part1.enabled = true
        newPlanetWindow.part2.enabled = true
        newPlanetWindow.part3.enabled = true

        switch (galaxyEngine.getPlanetsSlot(planetNumber)) {

        case galaxyEngine.get("1.png", screenName):
            newPlanetWindow.part1.enabled = false
            newPlanetWindow.part2.enabled = true
            newPlanetWindow.part3.enabled = true
            break;
        case galaxyEngine.get("2.png", screenName):
            newPlanetWindow.part1.enabled = false
            newPlanetWindow.part2.enabled = false
            newPlanetWindow.part3.enabled = true
            break;
        case galaxyEngine.get("3.png", screenName):
            newPlanetWindow.part1.enabled = false
            newPlanetWindow.part2.enabled = false
            newPlanetWindow.part3.enabled = false
            break;
        default:
            newPlanetWindow.part1.enabled = true
            newPlanetWindow.part2.enabled = true
            newPlanetWindow.part3.enabled = true
            break;
        }

        newPlanetWindow.visible = true;
    }

    SequentialAnimation {
        id: scalePlanet

        ParallelAnimation {

            NumberAnimation {
                target: planets;
                duration: 400;
                property: "x";
                to: planets.xCoords + solarSystem.x
            }
            NumberAnimation {
                target: planets;
                duration: 400;
                property: "y";
                to: planets.yCoords
            }
        }
        ScaleAnimator {
            target: solarSystem
            duration: 400
            from: 1
            to: 3
        }
    }

    SequentialAnimation {
        id: rescalePlanet

        ScaleAnimator {
            target: solarSystem
            duration: 400
            from: 3
            to: 1
        }

        ParallelAnimation {
            NumberAnimation {
                target: planets;
                duration: 400;
                property: "x";
                from: planets.xCoords + solarSystem.x
                to: 0
            }
            NumberAnimation {
                target: planets;
                duration: 400;
                property: "y";
                from: planets.yCoords
                to: 0
            }
        }
    }

    MouseArea {
        anchors.fill: solarSystem
        id: ssArea

        onClicked: {
            if(solarSystem.scale !== 1) {
                newPlanetWindow.visible = false
                rescalePlanet.running = true
            }
        }
    }

    Item {
        property real xCoords: -1
        property real yCoords: -1

        anchors.fill: parent
        id:planets

        Image {
            id: slot1
            x: 0
            y: 0
            height: 50
            width: 50
            source: galaxyEngine.planet1

            MouseArea {
                id: slot1Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {

                        planetNumber = 0
                        currentPlanet = slot1
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot1, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot2
            x: parent.width
            y: parent.height
            height: 50
            width: 50
            source: galaxyEngine.planet2

            MouseArea {
                id: slot2Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 1
                        currentPlanet = slot2
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot2, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot3
            x: parent.width / 2
            y: parent.height / 2 - parent.width / 6
            height: 50
            width: 50
            source: galaxyEngine.planet3

            MouseArea {
                id: slot3Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 2
                        currentPlanet = slot3
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot3, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot4
            x: parent.width / 2 - parent.width / 9
            y: 8 * parent.height / 9
            height: 50
            width: 50
            source: galaxyEngine.planet4

            MouseArea {
                id: slot4Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 3
                        currentPlanet = slot4
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot4, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot5
            x: parent.width / 2 + parent.width / 6
            y: 14 * parent.height / 15
            height: 50
            width: 50
            source: galaxyEngine.planet5

            MouseArea {
                id: slot5Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 4
                        currentPlanet = slot5
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot5, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot6
            x: parent.width / 2 - parent.width / 3
            y: parent.height / 2
            height: 50
            width: 50
            source: galaxyEngine.planet6

            MouseArea {
                id: slot6Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 5
                        currentPlanet = slot6
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot6, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot7
            x: parent.width / 2 + parent.width / 3
            y: 2 * parent.height / 3
            height: 50
            width: 50
            source: galaxyEngine.planet7

            MouseArea {
                id: slot7Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 6
                        currentPlanet = slot7
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot7, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }

        Image {
            id: slot8
            x: 9 * parent.width / 10
            y: parent.height / 10
            height: 50
            width: 50
            source: galaxyEngine.planet8

            MouseArea {
                id: slot8Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 60
                        parent.width = 60
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height = 50
                        parent.width = 50
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 7
                        currentPlanet = slot8
                        newPlanetWindow.planetNumber = planetNumber
                        Engine.scale(planets, solarSystem, slot8, scalePlanet)

                        setPlanetInfo()
                    }
                }
            }
        }
    }
}

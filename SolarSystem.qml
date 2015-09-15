import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import galaxy.engine 1.0
import "sceneEngine.js" as Engine

Item {
    property CreateNewPlanet newPlanetWindow: newPlanetWindow
    property GalaxyEngine galaxyEngine: galaxyEngine
    property Image carrentPlanet: carrentPlanet
    property string screenName: "playField"
    property bool isEmptySlot: false
    property int planetNumber: -1

    id: solarSystem

    Timer {
        id: timer
        interval: 800; running: false; repeat: false
        onTriggered: {
            newPlanetWindow.x = carrentPlanet.x + planets.xCoords
            newPlanetWindow.y = carrentPlanet.y + planets.yCoords + 3.5*carrentPlanet.height

            newPlanetWindow.planetName.text = galaxyEngine.getPlanetsName(planetNumber)
            newPlanetWindow.visible = true;
        }
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

//        Image {
//            id: stars1
//            x: -600
//            y: -600
//            source: "/images/stars1.png"
//        }

        Image {
            id: slot1
            x: 0
            y: 0
            height: 50
            width: 50
            source: galaxyEngine.getPlanetSlot(0)

            MouseArea {
                id: slot1Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 0
                        Engine.scale(planets, solarSystem, slot1, scalePlanet)

                        carrentPlanet = slot1
                        timer.running = true

                        galaxyEngine.getPlanetSlot(0) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(1)

            MouseArea {
                id: slot2Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 1
                        Engine.scale(planets, solarSystem, slot2, scalePlanet)

                        carrentPlanet = slot2
                        timer.running = true

                        galaxyEngine.getPlanetSlot(1) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(2)

            MouseArea {
                id: slot3Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 2
                        Engine.scale(planets, solarSystem, slot3, scalePlanet)

                        carrentPlanet = slot3
                        timer.running = true

                        galaxyEngine.getPlanetSlot(2) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(3)

            MouseArea {
                id: slot4Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 3
                        Engine.scale(planets, solarSystem, slot4, scalePlanet)

                        carrentPlanet = slot4
                        timer.running = true

                        galaxyEngine.getPlanetSlot(3) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(4)

            MouseArea {
                id: slot5Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 4
                        Engine.scale(planets, solarSystem, slot5, scalePlanet)

                        carrentPlanet = slot5
                        timer.running = true

                        galaxyEngine.getPlanetSlot(4) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(5)

            MouseArea {
                id: slot6Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 5
                        Engine.scale(planets, solarSystem, slot6, scalePlanet)

                        carrentPlanet = slot6
                        timer.running = true

                        galaxyEngine.getPlanetSlot(5) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(6)

            MouseArea {
                id: slot7Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 6
                        Engine.scale(planets, solarSystem, slot7, scalePlanet)

                        carrentPlanet = slot7
                        timer.running = true

                        galaxyEngine.getPlanetSlot(6) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
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
            source: galaxyEngine.getPlanetSlot(7)

            MouseArea {
                id: slot8Area
                hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    if(solarSystem.scale !== 3) {
                        parent.height += 10
                        parent.width += 10
                    }
                }
                onExited: {
                    if(solarSystem.scale !== 3) {
                        parent.height -= 10
                        parent.width -= 10
                    }
                }
                onClicked: {
                    if(solarSystem.scale !== 3) {
                        planetNumber = 7
                        Engine.scale(planets, solarSystem, slot8, scalePlanet)

                        carrentPlanet = slot8
                        timer.running = true

                        galaxyEngine.getPlanetSlot(7) === graphicEngine.get("add.png", screenName)
                                ? isEmptySlot = true
                                : isEmptySlot = false
                    }
                }
            }
        }
    }
}

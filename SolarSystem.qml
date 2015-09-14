import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import galaxy.engine 1.0
import "sceneEngine.js" as Engine

Item {
    property CreateNewPlanet newPlanetWindow: newPlanetWindow
    property GalaxyEngine galaxyEngine: galaxyEngine
    property Image carrentPlanet: carrentPlanet
    property bool isEmptySlot: false
    property int planetNumber: -1

    id: solarSystem

    Timer {
        id: timer
        interval: 1; running: false; repeat: false
        onTriggered: {

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
                        carrentPlanet = slot1
                        planetNumber = 0
                        Engine.scale(planets, solarSystem, slot1, scalePlanet)
                    }
                    newPlanetWindow.x = slot1.x + slot1.width
                    newPlanetWindow.y = slot1.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(0) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot2
                        planetNumber = 1
                        Engine.scale(planets, solarSystem, slot2, scalePlanet)
                    }
                    newPlanetWindow.x = slot2.x + slot2.width
                    newPlanetWindow.y = slot2.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(1) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot3
                        planetNumber = 2
                        Engine.scale(planets, solarSystem, slot3, scalePlanet)
                    }
                    newPlanetWindow.x = slot3.x + slot3.width
                    newPlanetWindow.y = slot3.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(2) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot4
                        planetNumber = 3
                        Engine.scale(planets, solarSystem, slot4, scalePlanet)
                    }
                    newPlanetWindow.x = slot4.x + slot4.width
                    newPlanetWindow.y = slot4.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(3) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot5
                        planetNumber = 4
                        Engine.scale(planets, solarSystem, slot5, scalePlanet)
                    }
                    newPlanetWindow.x = slot5.x + slot5.width
                    newPlanetWindow.y = slot5.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(4) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot6
                        planetNumber = 5
                        Engine.scale(planets, solarSystem, slot6, scalePlanet)
                    }
                    newPlanetWindow.x = slot6.x + slot6.width
                    newPlanetWindow.y = slot6.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(5) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot7
                        planetNumber = 6
                        Engine.scale(planets, solarSystem, slot7, scalePlanet)
                    }
                    newPlanetWindow.x = slot7.x + slot7.width
                    newPlanetWindow.y = slot7.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(6) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
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
                        carrentPlanet = slot8
                        planetNumber = 7
                        Engine.scale(planets, solarSystem, slot8, scalePlanet)
                    }
                    newPlanetWindow.x = slot8.x + slot8.width
                    newPlanetWindow.y = slot8.y

                    timer.running = true

                    galaxyEngine.getPlanetSlot(7) === "/images/add.png"
                            ? isEmptySlot = true
                            : isEmptySlot = false
                }
            }
        }
    }
}

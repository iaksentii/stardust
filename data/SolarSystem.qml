import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
//import Qt.labs.particles 1.0
import "sceneEngine.js" as Engine
import "."

Item {
    property Image currentPlanet: slot1
    property string screenName: "playField"
    property int planetNumber: -1

    id: solarSystem

    function setPlanetInfo() {

        if(newPlanetWindow.planetTag[planetNumber] === "add")
            newPlanetWindow.chooseType.visible = true;

        newPlanetWindow.x = currentPlanet.x + planets.xCoords
        newPlanetWindow.y = currentPlanet.y + planets.yCoords + 3.5*currentPlanet.height

        newPlanetWindow.planetName.text = galaxyEngine.getPlanetsName(planetNumber)
        newPlanetWindow.planetImage.source = currentPlanet.source

        newPlanetWindow.part1.visible = true
        newPlanetWindow.part2.visible = true
        newPlanetWindow.part3.visible = true

        switch (newPlanetWindow.planetTag[planetNumber]) {

        case "1":
            newPlanetWindow.part1.visible = false
            newPlanetWindow.part2.visible = true
            newPlanetWindow.part3.visible = true
            break;
        case "2":
            newPlanetWindow.part1.visible = false
            newPlanetWindow.part2.visible = false
            newPlanetWindow.part3.visible = true
            break;
        case "3":
            newPlanetWindow.part1.visible = false
            newPlanetWindow.part2.visible = false
            newPlanetWindow.part3.visible = false
            break;
        default:
            newPlanetWindow.part1.visible = true
            newPlanetWindow.part2.visible = true
            newPlanetWindow.part3.visible = true
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

        Rectangle {

            property int countClickes: 0
            id: sun
            x: parent.width / 2
            y: parent.height / 2
            height: 200
            width: 200
            color: "transparent"

            Image {
                id: sunShine
                source: galaxyEngine.get("sunshine.png", screenName)
                anchors.fill: parent
            }
            Image {
                id: sunCore
                source: galaxyEngine.get("sun.png", screenName)
                anchors.centerIn: parent
                height: 150
                width: 150
            }

//            MouseArea {
//                onClicked: {
//                    parent.countClickes += 1;
//                    if(parent.countClickes === 20)
//                        particle.enabled = true


//                }
//            }

//            Particles {
//                id: particle
//                enabled: false
//                y: sunCore.x
//                width: parent.width
//                height: 30
//                source: "plazma.png"
//                lifeSpan: 5000
//                count: 50
//                angle: 70
//                angleDeviation: 36
//                velocity: 30
//                velocityDeviation: 10

//                ParticleMotionWander {
//                    xvariance: 30
//                    pace: 100
//                }

//            }

            SequentialAnimation {
                running: true
                loops: -1


                NumberAnimation {
                    target: sunShine;
                    duration: 900;
                    property: "rotation";
                    to: 20
                }
                NumberAnimation {
                    target: sunShine;
                    duration: 900;
                    property: "rotation";
                    to: 0
                }
            }
        }
    }
}

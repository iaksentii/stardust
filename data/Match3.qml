import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Particles 2.0
import "styles"

Item {
    id: root

    property string screen: "match3"
    property bool clicked: false
    property int index: -1
    property int moves: 0

    width: 1280
    height: 1024
    visible: true

    SideBar{

        Button{
            height: 50
            width: 90
            anchors.bottom: parent.handBook.top
            size: 10
            text: qsTr("NEW GAME")

            buttonArea.onClicked: {
                myModel.newGame();
            }
        }
    }
    Rectangle {
        id:mainRect

        anchors.centerIn: parent
        clip: true
        width: 800
        height: 850
        border.width: 5
        border.color: "#21a89f"

        Image {
            id: background

            anchors.fill: parent
            source: graphicEngine.get("match3.jpg",screen)
        }
        Rectangle{

            height: 80
            width: parent.width
            z:1
            color: "#21a89f"

            Button{
                width: 90
                height:parent.height
                text: qsTr("Hint")
                scale: 1
                clip: false
                buttonArea.onClicked: myModel.hint();
            }

            Row {
                anchors.centerIn: parent
                spacing: 20
                TextLabel { text: qsTr("Score") + ": " + myModel.config.score; font.pointSize: 16; color: "black"}
                TextLabel { text: qsTr("Moves Left") + ": " + (myModel.config.maxMoves - myModel.config.moves);font.pointSize: 16; color: "black"}
                TextLabel { text: qsTr("Minimum Score") + ": " + myModel.config.minScore;font.pointSize: 16; color: "black"}
            }
        }

        GridView {
            id: view
            z:0
            anchors.fill: parent
            cellHeight:  mainRect.height / (myModel.config.rows + 1)
            cellWidth:   mainRect.width / myModel.config.columns
            interactive: false
            focus: true
            verticalLayoutDirection: GridView.BottomToTop
            model: myModel

            move: Transition {
                id: moveAnim
                NumberAnimation {
                    easing.type: Easing.OutCubic
                    properties: myModel.config.propertyAnim
                    duration: 500
                    alwaysRunToEnd: true
                }
            }
            moveDisplaced: Transition {

                NumberAnimation {
                    easing.type: Easing.OutCubic; properties: "x"; duration: 500
                    alwaysRunToEnd: true
                }
            }

            delegate: Component {

                Item {
                    id: item

                    visible: index < 100
                    width: view.cellWidth
                    height: view.cellHeight

                    Image {
                        visible: itemVisible
                        id: iconLoader
                        anchors.centerIn: parent
                        width: type == 10 ? item.width : item.width * 0.7
                        height: type == 10 ? item.height : item.height * 0.7

                        source: graphicEngine.get(path,screen)
                        opacity: flag ? 0 : 1

                        Behavior on opacity { NumberAnimation {duration: 800} }

                        //                        Text {
                        //                            anchors.centerIn: parent
                        //                            text: index + " " + type
                        //                        }
                    }

                    SequentialAnimation {
                        id: scaleAnimForHint

                        loops: 4
                        alwaysRunToEnd: true
                        running: (index === myModel.elementToSwap1 || index === myModel.elementToSwap2) && !root.clicked
                        NumberAnimation {
                            from: 1
                            to: 1.3
                            target: iconLoader
                            property: "scale"
                            duration: 300
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            from: 1.3
                            to: 1
                            target: iconLoader
                            property: "scale"
                            duration: 300
                            easing.type: Easing.InOutQuad
                        }
                    }

                    ParticleSystem {
                        id: particleSystem

                        running: index === root.index
                        visible: index === root.index
                        anchors.fill: parent

                        ImageParticle {
                            anchors.fill: parent
                            color: "#21a89f"
                            source: graphicEngine.get("star1.png",screen)
                        }

                        Emitter {
                            id: particleEmitter

                            emitRate: 100
                            lifeSpan: 500
                            size: 8
                            sizeVariation: 5
                            width: parent.width
                            height: parent.height

                            shape: EllipseShape {
                                fill:false
                            }
                        }
                    }

                    ParticleSystem {
                        id: particlesToRemove

                        running: flag
                        visible: flag
                        anchors.fill: parent

                        ImageParticle {
                            anchors.fill: parent
                            source: graphicEngine.get("bee.png",screen)
                        }

                        Emitter {
                            id: particlesToRemoveEmitter

                            emitRate: 100
                            lifeSpan: 2000
                            size: 20
                            sizeVariation: 5
                            width: view.cellWidth
                            height: view.cellHeight

                            shape: RectangleShape {
                                fill:false
                            }
                        }
                    }

                    MouseArea {

                        anchors.fill: parent
                        onClicked: {
                            view.currentIndex = index;
                            // setGlobalScore();
                            if (root.clicked && (index != root.index) && (myModel.get(index).type != 10)) {
                                root.clicked = false;

                                if (myModel.config.moves < myModel.config.maxMoves) {
                                    root.index = myModel.swapTwoElements(root.index, index);
                                    root.moves = myModel.config.moves
                                    if ( not.isVictory ||not.movesNotAvaliable)
                                        not.visible = true;
                                }
                                if (root.index != -1 && root.index != -2) {
                                    root.clicked = true;
                                }
                            }
                            else if (!root.clicked &&  myModel.get(index).type !== 10){
                                root.clicked = true;
                                root.index = index;
                            }
                        }
                    }
                }


            }
        }
    }
    //    MessageDialog {
    //        id: messageDialog

    //        property bool isVictory: myModel.config.isVictory
    //        property bool  movesNotAvailable: myModel.config.moves === myModel.config.maxMoves

    //        title: movesNotAvailable ? qsTr("Try again") : qsTr("Victory")
    //        visible: isVictory || movesNotAvailable
    //        text: isVictory ? qsTr("Level Completed") :qsTr("Level failed")
    //        onAccepted:{
    //            myModel.newGame();
    //            setGlobalScore();
    //        }
    //    }
    Notification{
        id: not
        property bool isVictory: myModel.config.isVictory
        property bool  movesNotAvaliable: root.moves === myModel.config.maxMoves

        text: isVictory ? qsTr("Victory") : qsTr("You lose")
        visible: false

        button.text:  isVictory ? qsTr("Next level") : qsTr("Try again")
        button.buttonArea.onClicked: {
            root.moves = 0
            visible = false
            myModel.newGame()
        }
    }
    function setGlobalScore() {
        galaxyEngine.setResourcesCount(1, myModel.config.getResourses(1));
        galaxyEngine.setResourcesCount(2, myModel.config.getResourses(2));
        galaxyEngine.setResourcesCount(3, myModel.config.getResourses(3));
        galaxyEngine.setResourcesCount(4, myModel.config.getResourses(4));
        galaxyEngine.setResourcesCount(5, myModel.config.getResourses(5));
    }
}

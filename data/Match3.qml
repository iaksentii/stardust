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
                width: 70
                height:parent.height
                text: qsTr("Hint")
                buttonArea.onClicked: myModel.hint();
            }

            Row {
                anchors.centerIn: parent

                TextLabel { text: qsTr("Score") + ": " }
                TextLabel {id: currentScore; text: myModel.config.score}
                TextLabel { text: "       " + qsTr("Moves Left") + ": "}
                TextLabel { id: movesLeft; text: myModel.config.maxMoves - myModel.config.moves}
                TextLabel { text: "       " + qsTr("Minimum Score") + ": "}
                TextLabel { id: minScore; text: myModel.config.minScore}
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
                            if (root.clicked && (index != root.index) && (myModel.get(index).type != 10)) {
                                root.clicked = false;

                                if (myModel.config.moves < myModel.config.maxMoves) {
                                    root.index = myModel.swapTwoElements(root.index, index);
                                }
                                if (root.index != -1 && root.index != -2) {
                                    root.clicked = true;
                                }
                            }
                            else if (!root.clicked &&  myModel.get(index).type != 10){
                                root.clicked = true;
                                root.index = index;
                            }
                        }
                    }
                }


            }
        }
    }
    //    menuBar: MenuBar {
    //        Menu {
    //            title: qsTr("&File")
    //            MenuItem {
    //                text: qsTr("&New game")
    //                onTriggered: myModel.newGame();
    //            }
    //            MenuItem {
    //                text: qsTr("E&xit")
    //                onTriggered: Qt.quit();
    //            }
    //        }
    //        Menu {
    //            title: qsTr("Something")

    //            MenuItem {
    //                text: qsTr("Use hint")
    //                onTriggered: {
    //                    root.clicked = false;
    //                    myModel.hint();
    //                }
    //            }
    //        }
    //    }

    MessageDialog {
        id: messageDialog

        property bool isVictory: myModel.config.isVictory
        property bool  movesNotAvailable: myModel.config.moves === myModel.config.maxMoves

        title: movesNotAvailable ? qsTr("Try again") : qsTr("Victory")
        visible: isVictory || movesNotAvailable
        text: isVictory ? qsTr("Level Completed") :qsTr("Level failed")
        onAccepted: myModel.newGame();
    }
}

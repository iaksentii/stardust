import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: mainWindow
    visible: true
    visibility: "FullScreen"

    property var array: []

    Image {
        source: "qrc:/Images/Background.jpg"
    }

    Column {
        spacing: 20

        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            id: startGameButton
            color: "lightblue"; radius: 10.0
            width: 400; height: 50
            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "Start Game"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("StartGame")
                }
            }
        }
        Rectangle {
            id: handBookButton
            color: "gold"; radius: 10.0
            width: startGameButton.width; height: startGameButton.height

            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "HandBook"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("FFFF")
                }
            }
        }
        Rectangle {
            id: profileButton
            color: "lightgreen"; radius: 10.0
            width: startGameButton.width; height: startGameButton.height
            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "Profile"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("Profile")
                }
            }
        }
        Rectangle {
            id: optionsButton
            color: "lightblue"; radius: 10.0
            width: startGameButton.width; height: startGameButton.height
            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "Options"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("Options")
                }
            }
        }
        Rectangle {
            id: moreInfoButton
            color: "gold"; radius: 10.0
            width: startGameButton.width; height: startGameButton.height
            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "More Info"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("MoreInfo")
                }
            }
        }
        Rectangle {
            color: "lightgreen"; radius: 10.0
            width: startGameButton.width; height: startGameButton.height
            Text {
                anchors.centerIn: parent
                font.pointSize: 24; text: "Quit"
                font.family: "Laksaman"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }

    Connections {
        target: ScreenManager
        onOpenWindowSignal: {
            var component = Qt.createComponent("qrc:/Loader.qml")
            if (component.status === Component.Ready) {
                var child = component.createObject(mainWindow)

                child.sourceName.source = windowName

                array.push(child)
            }
        }

        onCloseWindowSignal: {
            var element = array.pop()
            element.destroy()
        }
    }
}

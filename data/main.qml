import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

import "styles"
ApplicationWindow {
    id: mainWindow
    visible: true
    visibility: "FullScreen"

    property string screen: "mainWindow"
    property var array: []

    Image {
        source: graphicEngine.get("Background.jpg",screen)
    }

    Column {
        spacing: 20

        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.verticalCenter: parent.verticalCenter

        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "START GAME"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("StartGame")
                }
            }
        }
        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "HANDBOOK"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("FFFF")
                }
            }
        }
        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "PROFILE"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("Profile")
                }
            }
        }
        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "OPTIONS"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("Options")
                }
            }
        }
        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "MORE INFO"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    ScreenManager.loadWindow("MoreInfo")
                }
            }
        }
        Button {
            TextLabel {
                anchors.centerIn: parent
                text: "QUIT"
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
            var component = Qt.createComponent("Loader.qml")
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

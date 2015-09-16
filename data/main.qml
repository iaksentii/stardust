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
                text: "START GAME"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("StartGame")
                }
            }
        Button {
                text: "HANDBOOK"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("FFFF")
                }
        }
        Button {
                text: "PROFILE"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("Profile")
                }
        }
        Button {
                text: "OPTIONS"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("Options")
                }
        }
        Button {
                text: "MORE INFO"
                buttonArea.onClicked: {
                    ScreenManager.loadWindow("MoreInfo")
                }
        }
        Button {
                text: "QUIT"
                buttonArea.onClicked: {
                    Qt.quit()
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

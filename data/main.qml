import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2


ApplicationWindow {
    id:main
    visibility: "FullScreen"
    visible: true

    property var listOfWindows: []

    Connections {
        target: ScreenManager
        onOpenWindowSignal: {
            translator.translate(profileManager.currentPlayerData.get("language"))

            var component = Qt.createComponent("Loader.qml")
            if (component.status === Component.Ready) {

                var child = component.createObject(main)

                child.sourceName.source = windowName

                listOfWindows.push(child)
                gameConsole.parent = child
            }
        }

        onCloseWindowSignal: {
            if (listOfWindows.length > 1) {
                var element = listOfWindows.pop()
                element.destroy()
                gameConsole.parent = listOfWindows[listOfWindows.length-1]
            }
        }

    }

    Connections {
        target: translator
        onLanguageChanged : {
            var component = Qt.createComponent("Loader.qml")

            for (var i = 0; i < listOfWindows.length; i++) {
                var windowName = listOfWindows[i].sourceName.source
                listOfWindows[i].destroy()

                var child = component.createObject(main)
                child.sourceName.source = windowName

                listOfWindows[i] = child
            }
        }
    }

    Component.onCompleted: {
        ScreenManager.loadWindow("MainMenu")
        if (!profileManager.hasPlayers)
            ScreenManager.loadWindow("Profile")
    }

    Console {
        id: gameConsole

    }

}

import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: cons
    width: parent.width
    height: parent.height/2
    state: "hidden"
    color: "#8043d3ca"

    TextArea {
        id: consoleLog

        width: parent.width
        height: parent.height - 40
        readOnly: true
        backgroundVisible: false
        frameVisible: false
        style: TextAreaStyle {
            textColor: "white"

        }
    }

    TextField {
        id:textField
        width: parent.width
        height: 30

        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.leftMargin: 5
        anchors.left: parent.left
        anchors.rightMargin: 5

        style: TextFieldStyle {
            textColor: "white"

            background: Rectangle {
                color: "transparent"
            }
        }


        onTextChanged: {
            if (textField.text[textField.text.length-1] === '`') {
                textField.text = ""
                cons.state = "hidden"
                textField.focus = false
            }
        }

        onAccepted: {
            if (textField.text.length !== 0)
            {
                consoleLog.append("> " + textField.text)
                gameConsolee.performCommand(textField.text)
                textField.text = ""
            }
        }
    }

    Action {
        shortcut: "`"
        onTriggered: {
            if (cons.state == "hidden") {
                cons.state = "showed"
                textField.forceActiveFocus()

            }
        }
    }
    states: [
        State {
            name: "hidden"
            PropertyChanges {
                target: cons
                y: -(cons.height)
            }
        },

        State {
            name: "showed"
            PropertyChanges {
                target: cons
                y: 0
            }
        }
    ]

    transitions: Transition {
           NumberAnimation { target: cons; properties: "y"; easing.type: Easing.InOutQuad }
       }
}


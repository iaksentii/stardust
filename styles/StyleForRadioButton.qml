import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


RadioButtonStyle {
    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
        border.color: control.activeFocus ? "darkblue" : "gray"
        border.width: 1
        Rectangle {
            anchors.fill: parent
            visible: control.checked
            color: "orange"
            radius: 9
            anchors.margins: 4
        }
    }
}

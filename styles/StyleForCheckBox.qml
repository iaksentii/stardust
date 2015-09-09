import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

CheckBoxStyle {
    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
        border.color: control.activeFocus ? "darkblue" : "gray"
        border.width: 1
        Rectangle {
            visible: control.checked
            color: "orange"
            radius: 5
            anchors.margins: 4
            anchors.fill: parent
        }
    }
}

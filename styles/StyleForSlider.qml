import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

SliderStyle {
    groove: Rectangle {
        implicitWidth: 170
        implicitHeight: 8
        radius: 8
    }
    handle: Rectangle {
        anchors.centerIn: parent
        color: control.pressed ? "orange" : "white"
        border.color: "orange"
        border.width: 2
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
    }
}


import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

SliderStyle {
    property string style: "styles"
    property string path: "../"+graphicEngine.get("check.png",style)
    groove: Rectangle {
        implicitWidth: 140
        implicitHeight: 8
        radius: 50
        color: "#21a89f"
    }
    handle: Image {
        width: 30
        height: 30
        source: path//graphicEngine.get("shield.png",style)
    }

        /*Rectangle {
        anchors.centerIn: parent
        color: control.pressed ? "orange" : "white"
        border.color: "orange"
        border.width: 2
        implicitWidth: 20
        implicitHeight: 20
        radius: 10
    }*/
}

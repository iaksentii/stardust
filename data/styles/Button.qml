import QtQuick 2.0

Rectangle {
    id: button

    property alias text: text.text
    property alias size: text.font.pointSize
    property alias buttonArea: area

    border.width: 3
    border.color: "#21a89f"
    width: 300
    height: 60
    color: "#43d3ca"
    opacity: 0.7

    TextLabel{
        id: text
        anchors.centerIn: parent
        font.pointSize: 16
        color: "black"
    }
    MouseArea{
        id: area
        anchors.fill: parent
    }
    NumberAnimation {
        alwaysRunToEnd: true
        running: area.pressed
        from: 1
        to: 0.9
        target: button
        property: "scale"
        duration: 100
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        alwaysRunToEnd: true
        running: !area.pressed
        from: 0.9
        to: 1
        target: button
        property: "scale"
        duration: 100
        easing.type: Easing.InOutQuad
    }
}

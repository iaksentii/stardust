import QtQuick 2.0

Rectangle {
    id:playRect
    property string screen: "playField"
    width: 100
    height: 62
    color: "green"
    Image {
        anchors.fill: parent
        anchors.centerIn: parent
        id: img
        source: graphicEngine.get("apple.png",screen)
    }

}

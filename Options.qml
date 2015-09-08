import QtQuick 2.0

Rectangle {
    id:rect
    property string screen: "options"
     property alias color: rect.color
    width: 100
    height: 62
    color: "green"
    Image {
        anchors.fill: parent
        anchors.centerIn: parent
        id: img
        source: graphicEngine.get("star2.png",screen)
    }
}


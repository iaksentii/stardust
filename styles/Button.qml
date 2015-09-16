import QtQuick 2.0

Rectangle {
    property alias text: text.text
    property alias size: text.font.pointSize

    border.width: 3
    border.color: "#21a89f"
    width: 300
    height: 60
    color: "#43d3ca"
    opacity: 0.7

   TextLabel{
       anchors.centerIn: parent
       id: text
       font.pointSize: 16
       color: "black"
    }
}

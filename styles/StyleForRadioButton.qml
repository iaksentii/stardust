
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


RadioButtonStyle {
    property string style: "styles"
     property string path: "../"+graphicEngine.get("check.png",style)
    indicator: Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        color:"#3ef9ea"
        border.color: "#21a89f"
        border.width: 3
        Image{
            visible: control.checked
            anchors.margins: 4
            anchors.fill: parent
            source: path
        }
//        Rectangle {
//            anchors.fill: parent
//            visible: control.checked
//            color: "orange"
//            radius: 9
//            anchors.margins: 4
//        }
    }
}

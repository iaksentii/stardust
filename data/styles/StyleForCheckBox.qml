
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


CheckBoxStyle {
    property string style: "styles"
     property string path: "../" + graphicEngine.get("check.png",style)
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
//            visible: control.checked
//            color: "#43d3ca"
//            anchors.margins: 7
//            anchors.fill: parent
//        }
    }
}

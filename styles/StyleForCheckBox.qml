
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


CheckBoxStyle {
    property string style: "styles"
     property string path: "../"+graphicEngine.get("check.png",style)
    indicator: Rectangle {
        implicitWidth: 30
        implicitHeight: 30
        radius: 20
        border.color: control.activeFocus ? "darkblue" : "gray"
        border.width: 1

        Image{
            visible: control.checked
            anchors.margins: 4
            anchors.fill: parent
            source: path
        }

//        Rectangle {
//            visible: control.checked
//            color: "orange"
//            radius: 5
//            anchors.margins: 4
//            anchors.fill: parent
//        }
    }
}

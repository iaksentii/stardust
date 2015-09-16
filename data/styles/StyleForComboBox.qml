
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0


ComboBoxStyle {
    id: comboBox
    background: Rectangle {
        id: rectCategory
        border.width: 2
        color: "#43d3ca"
        border.color: "#21a89f"
    }
    label: TextLabel {
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 15
        font.capitalization: Font.SmallCaps
        color: "black"
        text: control.currentText
    }
    // drop-down customization here
    property Component __dropDownStyle: MenuStyle {
        __maxPopupHeight: 600
        __menuItemType: "comboboxitem"

        frame: Rectangle {              // background
            color: "#43d3ca"
            border.width: 2
            border.color: "#21a89f"
        }
                                        // an item text
        itemDelegate.label: TextLabel{

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 15
            font.capitalization: Font.SmallCaps
            color: styleData.selected ? "white" : "black"
            text: styleData.text
        }

        itemDelegate.background: Rectangle {// selection of an item
            radius: 2
            color: styleData.selected ? "#2aa29a" : "#43d3ca"
        }

        __scrollerStyle: ScrollViewStyle { }
    }

    property Component __popupStyle: Style {
        property int __maxPopupHeight: 400
        property int submenuOverlap: 0

        property Component frame: Rectangle {
            width: (parent ? parent.contentWidth : 0)
            height: (parent ? parent.contentHeight : 0) + 2
            border.color: "black"
            property real maxHeight: 500
            property int margin: 1
        }

        property Component menuItemPanel: Text {
            text: "NOT IMPLEMENTED"
            color: "red"
            font {
                pixelSize: 14
                bold: true
            }
        }
        property Component __scrollerStyle: null
    }
}

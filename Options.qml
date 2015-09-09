import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "styles"

Rectangle {
    width: 500
    height: 600
    color: "green"

    Column{
        anchors.verticalCenter:  parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        Column {
            spacing: 20
            Rectangle {
                width: 300
                height: 60
                radius: 40
                color: "lightblue"

                Text{
                    anchors.centerIn: parent
                    text: "Sound"
                }
            }
            Row{
                spacing: 10
                Slider{
                    minimumValue:0
                    maximumValue:100
                    stepSize:10
                    value:20
                    style: StyleForSlider{}
                }
                CheckBox {
                    text: checked ? "Sound on" : "Sound off"
                    style: StyleForCheckBox{}
                }
            }
        }

          Column{
              spacing: 10
        Rectangle {
            width: 300
            height: 60
            radius: 40
            color: "lightblue"

            Text{
                anchors.centerIn: parent
                text: "Graphic"
            }

        }
        GroupBox {
            anchors.horizontalCenter: parent.horizontalCenter
            title: "Graphic quality"

            Row {
                ExclusiveGroup { id: tabPositionGroup }
                RadioButton {
                    text: "High"
                    exclusiveGroup: tabPositionGroup
                    style: StyleForRadioButton{}
                }
                RadioButton {
                    text: "Low"
                    exclusiveGroup: tabPositionGroup
                    style: StyleForRadioButton{}
                }
            }
        }
}
        Rectangle {
            width: 300
            height: 60
            radius: 40
            color: "lightblue"

            Text{
                anchors.centerIn: parent
                text: "Localization"
            }

        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text{
                text: "Language"
            }

            ComboBox {
                width: 100
                currentIndex: 0
                style: ComboBoxStyle{}
                model: ListModel {
                    ListElement{ text: "Русский"}
                    ListElement{ text: "English"}
                }

            }
        }
    }
}


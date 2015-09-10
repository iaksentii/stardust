
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "styles"

Rectangle {

    property string screen: "options"
    width: 500
    height: 600

    FontLoader {
        id: font
        source: "data/fonts/font.ttf"
    }
    Image {

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        source: graphicEngine.get("options.jpg",screen)
    }
    Column{
        y: 160
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Column {
            spacing: 20

            Button {
                MyText{
                    text:"SOUND"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed:  {
                        soundRow.visible = true
                        graphicRow.visible = false
                        languageRow.visible = false
                    }
                }
            }
            Row{
                id: soundRow
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                Slider{
                    minimumValue:0
                    maximumValue:100
                    stepSize:10
                    value:20
                    style: StyleForSlider{}
                }
                CheckBox {
                    id: checkBox

                    style: StyleForCheckBox{
                        label: MyText{
                            font.pointSize: 10
                            text: "Enable sound"
                            color: "#43d3ca"
                        }
                    }
                }
            }

        }

        Column{
            spacing: 10
            Button {
                Behavior on y { NumberAnimation{duration: 500}}
                MouseArea{
                    anchors.fill: parent
                    onPressed:  {
                        soundRow.visible = false
                        graphicRow.visible = true
                        languageRow.visible = false
                    }
                }
                MyText{
                    text:"GRAPHIC"
                }

            }
            GroupBox {
                id: graphicRow
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                Row {
                    spacing: 10
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        text:"Graphics quality"
                        font.family: font.name
                        font.pointSize: 12
                        color: "#43d3ca"
                    }
                    ExclusiveGroup { id: tabPositionGroup }

                    Column {
                        RadioButton {
                            exclusiveGroup: tabPositionGroup
                            style: StyleForRadioButton{
                                label :   MyText{
                                    text: "High"
                                    color:"#43d3ca"
                                    font.pointSize: 8
                                }
                            }
                        }
                        RadioButton {
                            text: "Low"
                            exclusiveGroup: tabPositionGroup
                            style: StyleForRadioButton{
                                label :   MyText{
                                    text: "Low"
                                    color: "#43d3ca"
                                    font.pointSize: 8
                                }
                            }
                        }
                    }
                }
            }
        }
        Button{
            MyText{
                text: "LOCALIZATION"
            }
            MouseArea{
                anchors.fill: parent
                onPressed:  {
                    soundRow.visible = false
                    graphicRow.visible = false
                    languageRow.visible = true
                }
            }

        }
        Row {
            id: languageRow
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Text{
                anchors.verticalCenter: parent.verticalCenter
                font.family: font.name
                text: "Language"
                font.pointSize: 12
                color: "#43d3ca"
            }

            ComboBox {
                FontLoader {
                    id: combofont
                    source: "data/fonts/font.ttf"
                }
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


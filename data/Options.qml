
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Window 2.1
import QtQuick.Controls.Private 1.0
import QtMultimedia 5.0
import "styles"

Rectangle {
    id: options
    property string screen: "options"
    width: 500
    height: 600

    border.width: 10
    border.color: "#21a89f"
    Audio {
        id: music
        source: "sound.wav"  // Point this to a suitable video file
        autoPlay: true
    }
    Image {
        id:optionBG

        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        source: graphicEngine.get("options.jpg",screen)
    }

    FastBlur {
        anchors.fill: options

        width: itemColumn.width
        height: itemColumn.height
        source: optionBG
        radius: 32

    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 70
        text: qsTr("RETURN")

        buttonArea.onClicked: {
            ScreenManager.closeWindow()
        }
    }

    Item {
        id: itemColumn

        y: 160
        width: 400
        height: 400
        anchors.horizontalCenter: parent.horizontalCenter


        Column{
            id:column
            move: Transition{
                NumberAnimation {
                    easing.type: Easing.OutCubic
                    properties: "x,y"
                    duration: 200
                    alwaysRunToEnd: true
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Column {
                spacing: 20

                Button {
                    text:qsTr("SOUND")
                    buttonArea.onClicked:  {
                        soundRow.visible = true
                        graphicRow.visible = false
                        languageRow.visible = false
                    }
                }
                Row{
                    id: soundRow
                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Slider{
                        onValueChanged: music.volume = value
                        minimumValue:0.0
                        maximumValue:1.0
                        stepSize: 0.1
                        value:0.5
                        style: StyleForSlider{}
                    }
                    CheckBox {
                        id: checkBox
                        onCheckedChanged: {
                            if (checked) {
                                music.play();
                            }
                            else {
                                music.stop();
                            }
                        }

                        checked: true
                        style: StyleForCheckBox{
                            label:
                                TextLabel{
                                font.pointSize: 10
                                text: qsTr("Enable sound")
                                color: "#43d3ca"
                            }
                        }
                    }
                }

            }

            Column{
                spacing: 10
                Button {
                    text: qsTr("GRAPHIC")
                    buttonArea.onClicked:  {
                        soundRow.visible = false
                        graphicRow.visible = true
                        languageRow.visible = false
                    }

                }
                GroupBox {
                    id: graphicRow

                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    Row {
                        spacing: 10
                        TextLabel{
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("Graphics quality")
                            font.pointSize: 12
                            color: "#43d3ca"
                        }
                        ExclusiveGroup { id: tabPositionGroup }

                        Column {
                            spacing: 5
                            RadioButton {
                                checked: true
                                exclusiveGroup: tabPositionGroup
                                style: StyleForRadioButton{
                                    label :   TextLabel{
                                        text: "High"
                                        color:"#43d3ca"
                                        font.pointSize: 8
                                    }
                                }
                            }
                            RadioButton {
                                checked: false
                                text: qsTr("Low")
                                exclusiveGroup: tabPositionGroup
                                style: StyleForRadioButton{
                                    label :   TextLabel{
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
                text: qsTr("LOCALIZATION")
                buttonArea.onClicked:  {
                    soundRow.visible = false
                    graphicRow.visible = false
                    languageRow.visible = true
                }
            }
            Row {
                id: languageRow

                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10
                TextLabel{
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Language")
                    font.pointSize: 12
                    color: "#43d3ca"

                }

                ComboBox {
                    id:languageBar
                    width: 120
                    height: 30
                    currentIndex: profileManager.currentPlayerData.get("languageIndex") ? profileManager.currentPlayerData.get("languageIndex"):0
                    style: StyleForComboBox{}

                    model: ListModel {
                        ListElement{ text: "English"}
                        ListElement{ text: "Русский"}
                        ListElement{ text: "Українська"}
                    }
                    onCurrentTextChanged:   {

                        translator.translate(currentText)
                        profileManager.currentPlayerData.set("languageIndex",currentIndex)

                    }
                }
            }
        }
    }
}

import QtQuick 2.0

Text{
    font.family: font.name
    font.pointSize: 16
    color: "black"
    FontLoader {
        id: font
        source: "../fonts/font.ttf"
    }
}
import QtQuick
import QtQuick.Controls

Button {
    id: root

    property color color: root.checked ? "red" : "blue"


    width: 80
    height: 32
    checkable: true
    scale: root.pressed ? 0.8 : 1.0
    palette.buttonText: "white"

    background: Rectangle {
        color: root.color
        radius: 5
    }
}

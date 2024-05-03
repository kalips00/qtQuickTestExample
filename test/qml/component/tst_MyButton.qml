import QtQuick
import QtQuick.Window
import QtTest

import "../../../src/qml/component"

Rectangle {
    width: 500
    height: 500

    TestCase {
        id: root
        name: "ButtonTests"
        when: windowShown


        //! @brief Test the object size when user press on it
        function test_01_pressed_size()
        {
            root.mousePress(myButton);
            root.wait(1000);
            root.compare(myButton.scale, 0.8);
            root.mouseRelease(myButton)
            root.wait(1000);
            root.compare(myButton.scale, 1);
        }

        //! @brief Test the object size when user press on it
        function test_02_checked_color()
        {
            // button should be checked due to first test
            root.compare(myButton.color, "#ff0000");
            root.compare(myButton.text, "checked");

            // we uncheck the button
            root.mouseClick(myButton);
            root.wait(1000);
            root.compare(myButton.color, "#0000ff");
            root.compare(myButton.text, "unchecked");

            // we check again the button
            root.mouseClick(myButton);
            root.wait(1000);
            root.compare(myButton.color, "#ff0000");
            root.compare(myButton.text, "checked");
        }

    }


    MyButton {
        id: myButton
        anchors.centerIn: parent

        text: myButton.checked ? "checked" : "unchecked"
    }
}

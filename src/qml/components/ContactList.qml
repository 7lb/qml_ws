import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: root

    TextField {
        id: searchField

        anchors {
            left: root.left
            right: root.right
            top: root.top

            margins: 15
        }

        placeholderText: qsTr("Search contact")
    }
}

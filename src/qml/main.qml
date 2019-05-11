import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import "./components" as C

ApplicationWindow {
    id: app

    width: 394
    height: 700

    title: qsTr("Contacts")
    visible: true

    Material.theme: Material.System
    Material.primary: Material.Indigo
    Material.accent: Material.Indigo

    header: ToolBar {
        id: navigation
    }

    StackView {
        id: appStackView

        anchors {
            left: parent.left
            right: parent.right
            top: navigation.bottom
            bottom: parent.bottom
        }

        initialItem: C.ContactList {}
    }
}

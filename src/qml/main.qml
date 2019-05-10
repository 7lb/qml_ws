import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: app

    width: 394
    height: 700

    title: qsTr("Contacts")
    visible: true

    Material.theme: Material.System
    Material.primary: Material.Indigo
    Material.accent: Material.Indigo
}

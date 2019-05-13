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

        ToolButton {
            id: backNavBtn

            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }

            hoverEnabled: false

            icon.source: "qrc:/icons/arrow-left.svg"
            icon.color: Material.foreground

            visible: appStackView.depth > 1
            onClicked: appStackView.pop()
        }

        Text {
            id: title

            anchors {
                left: backNavBtn.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom

                rightMargin: backNavBtn.width + 7
                leftMargin: 7
            }

            text: appStackView.currentItem.navigationTitle

            color: Material.foreground
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    StackView {
        id: appStackView

        anchors {
            left: parent.left
            right: parent.right
            top: navigation.bottom
            bottom: parent.bottom
        }

        initialItem: contactList
    }

    Component {
        id: contactList
        C.ContactList {
            onContactSelected: appStackView.push(contactDetails, {
                contactData: contactData
            })
        }
    }

    Component {
        id: contactDetails
        C.ContactDetails {
            onContactDeleted: appStackView.pop()
        }
    }
}

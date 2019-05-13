import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import appTypes 1.0

Item {
    id: root

    readonly property string navigationTitle: qsTr("Contacts")

    signal contactSelected(Contact contactData)
    signal contactAddBtnClicked()

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

    ListView {
        id: contactsView

        anchors {
            left: root.left
            right: root.right
            top: searchField.bottom
            bottom: root.bottom

            margins: 15
        }

        ScrollBar.vertical: ScrollBar { id: scrollBar }

        delegate: ItemDelegate {
            readonly property Contact contact: Contact {
                contactUuid: model.contactUuid
                contactName: model.contactName
                contactPhoneNo: model.contactPhoneNo
                contactEmail: model.contactEmail
            }

            width: contactsView.width

            text: contact.contactName
            hoverEnabled: false

            onClicked: root.contactSelected(contact)
        }

        model: appContactModel
        clip: true
    }

    RoundButton {
        id: addContactBtn

        anchors {
            right: root.right
            bottom: root.bottom

            margins: scrollBar.width + 15
        }

        width: 64
        height: 64

        icon.source: "qrc:/icons/plus.svg"
        icon.color: Material.foreground
        icon.width: 24
        icon.height: 24

        onClicked: root.contactAddBtnClicked()
    }
}

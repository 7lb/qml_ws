import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

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
            width: contactsView.width
            text: model.contactName
            hoverEnabled: false
        }

        model: contactsModel
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
    }

    ListModel {
        id: contactsModel

        ListElement {
            contactName: "John Doe"
            contactPhoneNo: "3330004567"
            contactEmail: "john.doe@somemail.com"
        }

        ListElement {
            contactName: "Jane Doe"
            contactPhoneNo: "3330004568"
            contactEmail: "jane.doe@somemail.com"
        }

        ListElement {
            contactName: "Alice"
            contactPhoneNo: "3330004569"
            contactEmail: "alice@wonderland.org"
        }

        ListElement {
            contactName: "Bob"
            contactPhoneNo: "3330004570"
            contactEmail: "bob@ross.com"
        }
    }
}

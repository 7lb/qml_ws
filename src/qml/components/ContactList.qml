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

    ListView {
        id: contactsView

        anchors {
            left: root.left
            right: root.right
            top: searchField.bottom
            bottom: root.bottom

            margins: 15
        }

        ScrollBar.vertical: ScrollBar {}

        delegate: ItemDelegate {
            width: contactsView.width
            text: model.contactName
        }

        model: contactsModel
        clip: true
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

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import appTypes 1.0

Item {
    id: root

    signal contactAdded()

    readonly property string navigationTitle: qsTr("Add contact")

    property Contact contactData: Contact {
        contactName: contactName.text
        contactPhoneNo: contactPhoneNo.text
        contactEmail: contactEmail.text
    }

    ColumnLayout {
        id: contactInfo

        anchors {
            left: root.left
            right: root.right
            top: root.top

            margins: 15
        }

        spacing: 7

        TextField {
            id: contactName
            Layout.fillWidth: true
            placeholderText: qsTr("Contact name")
        }

        TextField {
            id: contactPhoneNo
            Layout.fillWidth: true
            placeholderText: qsTr("Contact phone number")
        }

        TextField {
            id: contactEmail
            Layout.fillWidth: true
            placeholderText: qsTr("Contact email")
        }
    }

    Button {
        id: addContactBtn

        anchors {
            top: contactInfo.bottom
            horizontalCenter: contactInfo.horizontalCenter
        }

        text: qsTr("Add contact")
        onClicked: {
            appContactModel.addContact(contactData)
            root.contactAdded(contactData)
        }
    }
}

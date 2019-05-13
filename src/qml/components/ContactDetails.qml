import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts  1.12

import appTypes 1.0

Item {
    id: root

    signal contactDeleted()

    readonly property string navigationTitle: contactData.contactName

    property Contact contactData

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
            id: editableContactName

            Layout.fillWidth: true

            placeholderText: qsTr("Contact name")
            text: root.contactData.contactName
        }

        TextField {
            id: editableContactPhoneNo

            Layout.fillWidth: true

            placeholderText: qsTr("Contact phone number")
            text: root.contactData.contactPhoneNo
        }

        TextField {
            id: editableContactEmail

            Layout.fillWidth: true

            placeholderText: qsTr("Contact email")
            text: root.contactData.contactEmail
        }
    }

    Row {
        id: actionBtns

        anchors {
            top: contactInfo.bottom
            horizontalCenter: contactInfo.horizontalCenter

            margins: 15
        }

        height: 48
        spacing: 0

        ToolButton {
            id: deleteContactBtn

            height: actionBtns.height
            width: height

            hoverEnabled: false
            display: Button.IconOnly

            icon.source: "qrc:/icons/trash-can.svg"
            icon.color: Material.color(Material.Red)

            onClicked: {
                appContactModel.removeContact(root.contactData.contactUuid)
                root.contactDeleted()
            }
        }

        ToolButton {
            id: copyCotnactToClipboardBtn

            height: actionBtns.height
            width: height

            hoverEnabled: false
            display: Button.IconOnly

            icon.source: "qrc:/icons/copy-to-clipboard.svg"
            icon.color: Material.foreground
        }

        ToolButton {
            id: callContactBtn

            height: actionBtns.height
            width: height

            hoverEnabled: false
            display: Button.IconOnly

            icon.source: "qrc:/icons/phone.svg"
            icon.color: Material.foreground
        }

        ToolButton {
            id: messageContactBtn

            height: actionBtns.height
            width: height

            hoverEnabled: false
            display: Button.IconOnly

            icon.source: "qrc:/icons/message.svg"
            icon.color: Material.foreground
        }
    }
}

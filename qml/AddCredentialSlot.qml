import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

Dialog {
    title: qsTr("Add credential")
    standardButtons: StandardButton.NoButton
    modality: Qt.ApplicationModal
    property var settings
    property var device

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            columns: 2
            Button {
                Layout.columnSpan: 2
                text: qsTr("Scan a QR code")
                Layout.fillWidth: true
                onClicked: device.parseQr(ScreenShot.capture(), updateForm)
            }
            Label {
                text: qsTr("Secret key (base32)")
            }
            TextField {
                id: key
                Layout.fillWidth: true
                validator: RegExpValidator {
                    regExp: /[2-7a-zA-Z]+=*/
                }
            }
        }

        ColumnLayout {
            Label {
                text: qsTr("YubiKey Slot")
            }
            ExclusiveGroup {
                id: slotSelected
            }
            RadioButton {
                id: slot1
                enabled: settings.slot1
                text: qsTr("Slot 1")
                checked: true
                exclusiveGroup: slotSelected
                property string name: "1"
            }
            RadioButton {
                id: slot2
                enabled: settings.slot2
                text: qsTr("Slot 2")
                exclusiveGroup: slotSelected
                property string name: "2"
            }
        }

        ColumnLayout {

            RowLayout {
                CheckBox {
                    id: touch
                    text: "Require touch"
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            Button {
                text: qsTr("Add credential")
                enabled: acceptableInput()
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
                onClicked: addCredential()
            }
            Button {
                text: qsTr("Cancel")
                onClicked: close()
            }
        }
    }

    MessageDialog {
        id: noQr
        icon: StandardIcon.Warning
        title: qsTr("No QR code found")
        text: qsTr("Could not find a QR code.")
        standardButtons: StandardButton.Ok
    }

    MessageDialog {
        id: paddingError
        icon: StandardIcon.Critical
        title: qsTr("Wrong padding")
        text: qsTr("The padding of the key is incorrect.")
        standardButtons: StandardButton.Ok
    }

    MessageDialog {
        id: confirmOverWrite
        icon: StandardIcon.Warning
        title: qsTr("Overwrite credential?")
        text: qsTr("A credential with this name already exists. Are you sure you want to overwrite this credential?")
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        onAccepted: addCredential()
    }

    function clear() {
        key.text = ""
        touch.checked = false
    }

    function acceptableInput() {
        return key.text.length !== 0 && slotSelected.current !== null
    }

    function updateForm(uri) {
        if (uri) {
            key.text = uri.secret
        } else {
            noQr.open()
        }
    }

    function addCredential() {
        device.addSlotCredential(slotSelected.current.name, key.text,
                                 touch.checked, function (error) {
                                     if (error === 'Incorrect padding') {
                                         paddingError.open()
                                     }
                                     if (error) {
                                         console.log(error)
                                     }
                                     close()
                                     refreshDependingOnMode(true)
                                 })
    }
}

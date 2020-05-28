import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

StyledExpansionPanel {
    label: "Interfaces"
    description: qsTr("Enable/disable active interfaces on the YubiKey")
    isTopPanel: true
    isEnabled: true

    ColumnLayout {
        Label {
            text: "Test"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        RowLayout {
            Label {
                text: "CCID"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            ButtonGroup {
                id: childGroup
                exclusive: false
                checkState: a.checkState
            }

            CheckBox {
                indicator.width: 16
                indicator.height: 16

                id: a
                checkState: childGroup.checkState

            }
            CheckBox {
                indicator.width: 16
                indicator.height: 16
                id: b

            }

        }

        RowLayout {
            Label {
                text: "FIDO"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            CheckBox {
                indicator.width: 16
                indicator.height: 16

                id: d

                ButtonGroup.group: childGroup

            }
            CheckBox {
                indicator.width: 16
                indicator.height: 16
                id: e

            }

        }

    }
}

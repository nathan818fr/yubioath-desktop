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

    RowLayout {
        Label {
            text: "Test"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }
        ColumnLayout {
            Label {
                text: "USB"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            CheckBox {
                indicator.width: 16
                indicator.height: 16

                id: a

            }
            CheckBox {
                indicator.width: 16
                indicator.height: 16
                id: b

            }
            CheckBox {
                indicator.width: 16
                indicator.height: 16
                id: c

            }

        }

    }
}

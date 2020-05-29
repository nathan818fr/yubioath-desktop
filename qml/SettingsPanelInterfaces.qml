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

    ToolButton {
        property bool isExpanded: false
        id: expandButton
        onClicked:{
            a.visible = !a.visible
            isExpanded = a.visible
        }
        icon.width: 24
        icon.source: isExpanded ? "../images/up.svg" : "../images/down.svg"
        icon.color: primaryColor
        opacity: hovered ? fullEmphasis : lowEmphasis
        visible: isEnabled
        focus: true
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            enabled: false
        }
    }

    ColumnLayout {
        RowLayout {
            Text {
                text: "USB"
                color: "white"
            }
            Text {
                text: "NFC"
                color: "white"
            }

        }

        RowLayout {
            Label {
                text: "CCID"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            CheckBox {
                indicator.width: 16
                indicator.height: 16

                id: a
                visible: false

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

            }

        }

    }
}

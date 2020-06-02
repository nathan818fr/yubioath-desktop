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

                    id: ccidButton1

                }


            }

            RowLayout {
                Label {
                    id: ccidChild1Text
                    text: "CCID"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: ccidChild1
                    visible: false

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

                    id: fidoButton1

                }
            }

            RowLayout {
                Label {
                    id: fidoChild1Text
                    text: "FIDO2"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: fidoChild1
                    visible: false

                }
            }

            RowLayout {
                Label {
                    text: "OTP"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: otpButton1

                }

            }

        }

        ColumnLayout {
            anchors.left: parent.right
            RowLayout {
                ToolButton {
                        property bool isExpanded: false
                        id: expandButton
                        onClicked:{
                            ccidChild1.visible = !ccidChild1.visible
                            ccidChild1Text.visible = !ccidChild1Text.visible
                            isExpanded = ccidChild1.visible
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
            }

            RowLayout {
                ToolButton {
                    property bool isExpanded: false
                    id: expandButton2
                    onClicked:{
                        fidoChild1.visible = !fidoChild1.visible
                        fidoChild1Text.visible = !fidoChild1Text.visible
                        isExpanded = fidoChild1.visible
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
            }
        }
    }

}

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
                    id: text
                    text: "Interface"
                    color: "white"
                    Layout.minimumWidth: 200
                }
                Text {
                    id: text2
                    text: "USB"
                    color: "white"
                }
                Text {
                    id: text3
                    text: "NFC"
                    color: "white"
                }
            }

            RowLayout {
                Label {
                    text: "CCID (smart card)"
                    Layout.minimumWidth: 200
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                ButtonGroup {
                        id: ccidBtnGrp
                        exclusive: false
                        checkState: ccidButton1.checkState
                    }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: ccidButton1
                    checkState: ccidBtnGrp.checkState

                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: ccidButton2

                }

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
                Label {
                    id: ccidChild1Text
                    text: "CCID"
                    Layout.minimumWidth: 200
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: ccidChild1
                    visible: false
                    ButtonGroup.group: ccidBtnGrp

                }
            }

            RowLayout {
                ButtonGroup {
                        id: fidoBtnGrp
                        exclusive: false
                        checkState: fidoButton1.checkState
                    }

                Label {
                    text: "FIDO (WebAuthn)"
                    Layout.minimumWidth: 200
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: fidoButton1
                    checkState: fidoBtnGrp.checkState

                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: fidoButton2

                }

                ToolButton {
                    property bool isExpanded: false
                    id: expandButton2
                    onClicked:{
                        fidoChild1.visible = !fidoChild1.visible
                        fidoChild1Text.visible = !fidoChild1Text.visible
                        fidoChild2.visible = !fidoChild2.visible
                        fidoChild2Text.visible = !fidoChild2Text.visible
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

            RowLayout {
                Label {
                    id: fidoChild1Text
                    text: "FIDO2"
                    Layout.minimumWidth: 200
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: fidoChild1
                    visible: false
                    ButtonGroup.group: fidoBtnGrp

                }
            }

            RowLayout {
                Label {
                    id: fidoChild2Text
                    text: "FIDO U2F"
                    Layout.minimumWidth: 200
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    visible: false
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: fidoChild2
                    visible: false
                    ButtonGroup.group: fidoBtnGrp

                }
            }

            RowLayout {
                Label {
                    text: "OTP"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Layout.minimumWidth: 200
                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: otpButton1

                }

                CheckBox {
                    indicator.width: 16
                    indicator.height: 16

                    id: otpButton2

                }



            }

        }

    }

}

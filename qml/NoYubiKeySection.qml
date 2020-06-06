import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0

ColumnLayout {

    readonly property int dynamicWidth: 600
    readonly property int dynamicMargin: 32

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    height: parent.height

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        StyledImage {
            id: yubikeys
            source: "../images/ykfamily.svg"
            color: defaultImageOverlay
            iconWidth: 200
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            bottomPadding: 16
        }

        Label {
            text: {
                if (yubiKey.availableDevices.length > 0 && !yubiKey.availableDevices.some(function(dev) { return dev.selectable })) {
                    return qsTr("Unsupported device")
                }
                else {
                    return qsTr("Insert your YubiKey")
                }
            }
            font.pixelSize: 16
            font.weight: Font.Normal
            lineHeight: 1.5
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: primaryColor
            opacity: highEmphasis
        }
        Label {
            text: {
                if (yubiKey.availableDevices.length > 0 && !yubiKey.availableDevices.some(function(dev) { return dev.selectable })) {
                    return qsTr("Yubico Authenticator requires a CCID/OTP enabled and compatible YubiKey.")
                }
                else {
                    return ""
                }
            }
            visible: (yubiKey.availableDevices.length > 0 && !yubiKey.availableDevices.some(function(dev) { return dev.selectable }))
            Layout.minimumWidth: 300
            Layout.maximumWidth: app.width - dynamicMargin
                                 < dynamicWidth ? app.width - dynamicMargin : dynamicWidth
            horizontalAlignment: Qt.AlignHCenter
            Layout.rowSpan: 1
            lineHeight: 1.1
            wrapMode: Text.WordWrap
            font.pixelSize: 13
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: primaryColor
            opacity: lowEmphasis
        }
    }

    ColumnLayout {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
        Layout.topMargin: 4
        Layout.bottomMargin: 16

        Item {
            height: 1
        }

        Label {
            text: settings.useCustomReader ? qsTr("Interface: CCID - Custom reader") : qsTr("Interface: OTP")
            visible: settings.useCustomReader || settings.otpMode
            Layout.minimumWidth: 300
            Layout.maximumWidth: app.width - dynamicMargin
                                 < dynamicWidth ? app.width - dynamicMargin : dynamicWidth
            horizontalAlignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 13
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: primaryColor
            opacity: lowEmphasis
        }
        Label {
            text: {
                var t = yubiKey.availableReaders.filter(function(reader) { return reader.toLowerCase().indexOf(settings.customReaderName.toLowerCase()) !== -1 }).toString()
                if (t.length === 0)
                    t = qsTr("Custom reader not found!")
                return t
            }
            visible: settings.useCustomReader
            Layout.minimumWidth: 300
            Layout.maximumWidth: app.width - dynamicMargin
                                 < dynamicWidth ? app.width - dynamicMargin : dynamicWidth
            horizontalAlignment: Qt.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 13
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            color: primaryColor
            opacity: lowEmphasis
            maximumLineCount: 1
            elide: Text.ElideRight
        }
    }

}


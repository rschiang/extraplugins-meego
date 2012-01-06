import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.0

Page {
    id: mainPage

    Component.onCompleted: {
        if (initType==1)
        {
            editTools.visible=true
            tools=editTools
        }
        else
        {
            commonTools.visible=true
            tools=commonTools
        }
    }

    function checkFilled()
    {
        return (displayname.text.length>0 && username.text.length>0 && password.text.length>0);
    }

    function createAccount()
    {
        createfade.visible = true;
        actor.createAccount(displayname.text,
                            username.text,
                            password.text,
                            showicon.checked);
    }

    function saveAccount()
    {
        actor.saveAccount(displayname.text,
                          username.text,
                          password.text,
                          server.text,
                          port.text,
                          encryption.checked,
                          showicon.checked,
                          title.checked);
    }

    Flickable {
        anchors.fill: parent
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        flickableDirection: Flickable.VerticalFlick
        contentWidth: width
        contentHeight: content.height+5

        Column {
            id: content
            width: parent.width
            spacing: 10

            Title {
                id: title
                image: "image://theme/%1".arg(qsTrId("qtn_%1_icon".arg(xservice)))
                title: qsTrId("qtn_%1_name".arg(xservice))
                subtitle: qsTrId("qtn_%1_setup".arg(xservice))
                width: parent.width
                showcheckbox: initType==1
                checked: enabledvalue
            }

            LabeledTextField {
                id: displayname
                width: parent.width
                label: qsTrId("qtn_display_name")
                placeholderText: qsTrId("qtn_set_display_name")
                text: displaynametext
            }

            LabeledTextField {
                id: username
                width: parent.width
                inputMethodHints: unamenumeric?Qt.ImhDigitsOnly:0
                label: qsTrId("qtn_%1_username".arg(xservice))
                placeholderText: qsTrId("qtn_%1_set_username".arg(xservice))
                text: usernametext
            }

            LabeledTextField {
                id: password
                width: parent.width
                echoMode: TextInput.Password
                label: qsTrId("qtn_password")
                placeholderText: qsTrId("qtn_set_password")
                text: passwordtext
            }

            LabeledTextField {
                id: server
                width: parent.width
                label: qsTrId("qtn_server")
                placeholderText: qsTrId("qtn_set_default_server")
                visible: (initType==1)?serverset:false
                clearbutton: true
                text: servertext
            }

            LabeledTextField {
                id: port
                width: parent.width
                inputMethodHints: Qt.ImhDigitsOnly
                label: qsTrId("qtn_port")
                placeholderText: qsTrId("qtn_set_default_port")
                clearbutton: true
                visible: initType==1
                text: porttext
            }

            LabeledSwitch {
                id: encryption
                width: parent.width
                text: qsTrId("qtn_encryption_enabled")
                visible: (initType==1)?encryptionset:false
                checked: encryptionvalue
            }

            LabeledSwitch {
                id: showicon
                width: parent.width
                text: qsTrId("qtn_desktop_icon")
                checked: showiconvalue
            }

            ButtonElement {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTrId("qtn_create_account")
                visible: initType!==1
                width: parent.width/2
                enabled: checkFilled()
                onClicked: createAccount()
            }

            Item {
                height: 120-title.extraheight
                width: parent.width
                visible: extratextvisible
            }


            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 24
                visible: extratextvisible
                text: "<a style='color:#40a0ff' href='%1'>%2</a>".arg(qsTrId("qtn_%1_extra_link".arg(xservice))).arg(qsTrId("qtn_%1_extra_text".arg(xservice)))
                onLinkActivated: Qt.openUrlExternally(link)
            }
        }
    }

    Rectangle {
        id: createfade
        anchors.fill: parent
        color: "black"
        visible: onloadbusy

        Column {
            anchors.centerIn: parent
            width: parent.width
            spacing: 30

            BusyIndicator {
                anchors.horizontalCenter: parent.horizontalCenter
                platformStyle: BusyIndicatorStyle { size: "large" }
                running: parent.visible
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.WordWrap
                text: qsTrId("qtn_creating")
                visible: !onloadbusy
            }
        }
    }
}

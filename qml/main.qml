import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: false
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: Qt.quit()
        }
    }

    ToolBarLayout {
        id: editTools
        visible: false
        ToolButton {
            text: qsTrId("qtn_button_save")
            enabled: mainPage.checkFilled()
            onClicked: mainPage.saveAccount()
        }
        ToolButton {
            text: qsTrId("qtn_button_cancel")
            onClicked: Qt.quit()
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTrId("qtn_delete_account"); onClicked: delconfirm.open() }
        }
    }

    QueryDialog {
        id: delconfirm
        titleText: qsTrId("qtn_delete_title")
        message: qsTrId("qtn_delete_message")
        acceptButtonText: qsTrId("qtn_delete_accept")
        rejectButtonText: qsTrId("qtn_delete_reject")
        onAccepted: actor.deleteAccount()
    }
}

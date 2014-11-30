import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.0
import st.app 1.0 as AppStreet

ApplicationWindow {
    id: root

    property url activeDatabase

    objectName: "mainWindow"
    visible: true
    width: 1424
    height: 768
    title: qsTr("SQLite Editor")
    color: "transparent"
    flags: Qt.FramelessWindowHint

    Rectangle {
        anchors.fill: parent
        color: theme.lightgray
        radius: theme.windowRadius
    }

    property alias fileDialog : _FileDialog
    FileDialog {
        id: _FileDialog
        title: "Please choose a file"
        nameFilters: [ "SQLite3 Databases (*.db *.sqlite3 *.sqlite)", "All files (*)" ]
        onAccepted: {
            activeDatabase = fileUrl
        }
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: {

                }
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    property alias theme : _Theme

    Theme {
        id: _Theme
    }

    property alias clipboard : _Clipboard
    AppStreet.Clipboard {
        id: _Clipboard
    }
}

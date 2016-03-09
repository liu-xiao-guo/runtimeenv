import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import ReadEnv 1.0
import "ui"

/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    id: root

    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.liu-xiao-guo.ReadEnv"

    anchorToKeyboard: true

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    width: units.gu(50)
    height: units.gu(75)

    property string app_pkgname

    ReadEnv {
        id: readEnv
    }

    Flickable {
        id: scrollWidget
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        boundsBehavior: (contentHeight > root.height) ? Flickable.DragAndOvershootBounds : Flickable.StopAtBounds
        /* Set the direction to workaround https://bugreports.qt-project.org/browse/QTBUG-31905
           otherwise the UI might end up in a situation where scrolling doesn't work */
        flickableDirection: Flickable.VerticalFlick

        Column {
            anchors.left: parent.left
            anchors.right: parent.right

            ListItem.Base {
                height: ubuntuLabel.height + runtime.height + units.gu(6)

                Column {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.centerIn: parent
                    spacing: units.gu(2)
                    Label {
                        id: ubuntuLabel
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: ""
                        fontSize: "x-large"
                    }
                    Label {
                        id: runtime
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Runtime Environment"
                    }
                }
            }

            ListItem.Subtitled {
                text: i18n.tr("UBUNTU_APPLICATION_ISOLATION")
                subText: readEnv.getenv("UBUNTU_APPLICATION_ISOLATION")
            }

            ListItem.Subtitled {
                text: i18n.tr("APP_ID")
                subText: readEnv.getenv1("APP_ID")
            }

            ListItem.Subtitled {
                text: i18n.tr("XDG_CACHE_HOME")
                subText: readEnv.getenv("XDG_CACHE_HOME")
            }

            ListItem.Subtitled {
                text: i18n.tr("XDG_CONFIG_HOME")
                subText: readEnv.getenv("XDG_CONFIG_HOME")
            }

            ListItem.Subtitled {
                text: i18n.tr("XDG_DATA_HOME")
                subText: readEnv.getenv("XDG_DATA_HOME")
            }

            ListItem.Subtitled {
                text: i18n.tr("XDG_RUNTIME_DIR")
                subText: readEnv.getenv("XDG_RUNTIME_DIR")
            }

            ListItem.Subtitled {
                text: i18n.tr("TMPDIR")
                subText: readEnv.getenv("TMPDIR")
            }

            ListItem.Subtitled {
                text: i18n.tr("PWD")
                subText: readEnv.getenv("PWD")
            }

            ListItem.Subtitled {
                text: i18n.tr("APP_PKGNAME")
                subText: app_pkgname
            }

            ListItem.Subtitled {
                text: i18n.tr("PATH")
                subText: readEnv.getenv("PATH")
            }

            ListItem.Subtitled {
                text: i18n.tr("LD_LIBRARY_PATH")
                subText: readEnv.getenv("LD_LIBRARY_PATH")
            }

            ListItem.Subtitled {
                text: i18n.tr("QML2_IMPORT_PATH")
                subText: readEnv.getenv1("QML2_IMPORT_PATH")
            }
        }
    }

    Component.onCompleted: {
        var APP_ID = readEnv.getenv("APP_ID");

        console.log("APP_ID: " + APP_ID );
        app_pkgname = APP_ID.split('_')[0]
        console.log("APP_PKGNAME: " + app_pkgname);
    }
}


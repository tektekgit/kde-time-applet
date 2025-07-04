import QtQuick 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 1.0

PlasmaCore.Applet {
    id: applet
    width: 600
    height: 200

    // Load translations
    PlasmaCore.LanguageHandler {
        id: languageHandler
        onLanguageChanged: {
            timeText.text = qsTr("Time: %1").arg(currentTime());
        }
    }

    Component.onCompleted: {
        // Set transparency or background as needed
        applet.backgroundHints = PlasmaCore.Applet.TransparentBackground;
    }

    Item {
        width: parent.width
        height: parent.height

        Text {
            id: timeText
            anchors.centerIn: parent
            font.pixelSize: 50
            color: "white"

            property int updateInterval: 1000 // Update every second

            Timer {
                id: timer
                interval: updateInterval
                running: true
                repeat: true
                onTriggered: {
                    timeText.text = qsTr("Time: %1").arg(currentTime());
                }
            }

            function currentTime() {
                var date = new Date();
                return Qt.formatDate(date, "yyyy-MM-dd hh:mm:ss");
            }
        }
    }
}

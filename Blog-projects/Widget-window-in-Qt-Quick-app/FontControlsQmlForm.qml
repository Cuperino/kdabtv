import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import WidgetWindowsInQtQuickApp as Cpp

Window {
    id: window
    readonly property alias text: textField.text
    readonly property string font: fontSelector.model[fontSelector.currentIndex]
    signal toggleWidgetsWindow
    height: 110
    width: 300
    minimumHeight: 110
    minimumWidth: 260
    visible: true
    title: qsTr("Font Controls - Qt Quick")
    color: systemPalette.window
    SystemPalette {
        id: systemPalette
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        TextField {
            id: textField
            text: "KDAB"
            focus: true
            Layout.fillWidth: true
        }
        Button {
            text: "Switch to Widgets Form"
            Layout.fillWidth: true
            onClicked: {
                window.toggleWidgetsWindow();
            }
        }
        ComboBox {
            id: fontSelector
            model: fontsBackend.fontList()
            editable: true
            Layout.fillWidth: true
            Component.onCompleted: {
                if (!fontSelector.currentIndex)
                    currentIndex = indexOfValue("Noto Sans")
            }
            Cpp.FontsBackend {
                id: fontsBackend
            }
        }
    }
}

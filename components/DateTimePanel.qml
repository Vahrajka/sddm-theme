import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
	spacing: 0
	//anchors.top: parent.top
        //anchors.left: parent.left
        //anchors.margins: 20 
	anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: +47


    Text {
        id: timeLabel

        opacity: config.TimeOpacity
        
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.TimeSize
        font.bold: config.TimeIsBold == "true" ? true : false
        color: config.TimeColor

        function updateTime() {
          text = new Date().toLocaleTimeString(Qt.locale(config.Locale), config.HourFormat == "long" ? Locale.LongFormat : config.HourFormat !== "" ? config.HourFormat : Locale.ShortFormat)
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.updateTime()
            dateLabel.updateDate()
        }
    }

    Component.onCompleted: {
        timeLabel.updateTime()
        dateLabel.updateDate()
    }
}

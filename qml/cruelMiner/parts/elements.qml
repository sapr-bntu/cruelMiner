// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: rectangless

 property alias text: textItem.text

    width: 200
    height: 40
    color: "#ffffff"
    opacity: 0

    Text {
        anchors.fill: parent
        color: "#ffffff"
        id: textItem
        text: "save"
        opacity: 1
       font.pixelSize: 36
       anchors.centerIn: parent
       font.family: "Comic Sans MS"
       horizontalAlignment: Text.AlignHCenter
      }

}

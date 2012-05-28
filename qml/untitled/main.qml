// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7

Rectangle {
    width: 480
    height: 640
    color: "#3a2b24"
    id:page
    property int  score: 0

    function dbInit() {
      console.log("create base1");
       var db = openDatabaseSync("

.sdb", "1.0", "The Example QML SQL!", 1000000);
         console.log("create base2");
          db.transaction(

                 function(tx) {
// Create the database if it doesn't already exist
                       tx.executeSql('CREATE TABLE IF NOT EXISTS [students] ([id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                                    '[Name] VARCHAR(255)  NULL,'+
                                     '[account] VARCHAR(255)  NULL)');

// Add (another) greeting row
                      // tx.executeSql("insert into students ('Name', 'account') values (  'Авдей', '107518');");
                   }
           )
 }
    Text {
        id: text1
        x: 0
        y: 29
        width: 480
        height: 72
        color: "#ffffff"
        text: qsTr("Jumper")
        horizontalAlignment: Text.AlignHCenter
        font.family: "Comic Sans MS"
        wrapMode: Text.WordWrap
        font.pixelSize: 52
    }

    Text {
        id: text2
        x: 0
        y: 214
        width: 480
        height: 50
        color: "#ffffff"
        text: qsTr("New game")
        font.family: "Comic Sans MS"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36
        MouseArea {
            id: mousearea1
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {
                page.state="State1"
            }
        }

    }

    Text {
        id: text3
        x: 0
        y: 323
        width: 480
        height: 51
        color: "#ffffff"
        text: qsTr("Scores")
        styleColor: "#ffffff"
        font.family: "Comic Sans MS"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36

    }

    Text {
        id: text4
        x: 0
        y: 424
        width: 480
        height: 51
        color: "#ffffff"
        text: qsTr("About")
        font.family: "Comic Sans MS"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 36
    }

    Text {
        id: text5
        x: 0
        y: 520
        width: 480
        height: 51
        color: "#ffffff"
        text: qsTr("Exit")
        font.family: "Comic Sans MS"
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#ffffff"
        font.pixelSize: 36
        MouseArea {
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {
                Qt.quit();
                // page.state="State2"
            }
        }
    }

    Image {
        id: image1
        x: 0
        y: 28
        width:480
        height: 640
        source: "Stone-Wall-Seamless-Pattern.jpg"
        opacity: 0
    }

    Rectangle {
        id: rectangle1
        x: 123
        y: 562
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0

        Text {
            id: text6
            x: 249
            y: 874
            text: qsTr("text")
            font.pixelSize: 12
            opacity: 0
        }

    }

    Text {
        id: text7
        x: 229
        y: 283
        text: qsTr("text")
        font.pixelSize: 12
        opacity: 0
    }

    Rectangle {
        focus: true
        id: rectangle2
        x: 117
        y: 464
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0
    }

    TextInput {
        focus: true
        id: text_input1
        x: 216
        y: 395
        width: 80
        height: 20
        text: qsTr("text")
        font.pixelSize: 12
        opacity: 0
    }

    Rectangle {
        id: rectangle3
        x: 52
        y: 1241
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0

        Text {
            id: buttonLabel
            text: "Save"
            font.pixelSize: 36
            anchors.centerIn: parent
            font.family: "Comic Sans MS"
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
               id: buttonMouseArea2

               anchors.fill: parent //прикрепим все стороны области мыши к якорям прямоугольника
                       //onClicked обработает корректные щелчки кнопки мыши
               onClicked: {
                   dbInit()
                   var db = openDatabaseSync("save.sdb", "1.0", "The Example QML SQL!", 1000000);
                     console.log("create base2");
                      db.transaction(

                             function(tx) {
             ////


                              tx.executeSql("insert into Students ( 'id','Name', 'account') values ('12',' text_input1.text', 'text1.text');");
                              console.log(' text_input1.text');
                              console.log('text1.text');
                          }
                          )
               }
           }
    }

    Rectangle {
        id: rectangle4
        x: 251
        y: 545
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0

        Text {
            id: buttonLabel2
            x: 15
            y: 5
            text: "Cancel"
            font.pixelSize: 36
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: 3
            font.family: "Comic Sans MS"
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
               id: buttonMouseArea3

               anchors.fill: parent //прикрепим все стороны области мыши к якорям прямоугольника
                       //onClicked обработает корректные щелчки кнопки мыши
               onClicked: {
                    page.state="исходное состояние"
               }
           }
    }
    function getscore(a) {
       if (a > page.score) page.score = a;
       return page.score - 90;
   }
    Rectangle {
        id: stats_block
        x: 70
        y: -49
        width: rectangle1.width
        height: 30
        color: "#222222"
        transformOrigin: Item.Center
        opacity: 0.860

        Text {
            id: name
            x: -73
            y: -46
            color: "#ffffff"
            text: "MonsterMiner"
            font.family: "Swis721 BlkCn BT"
            font.pointSize: 16
            z: 1
        }

        Text {
            id: score
            x: page.width-100;
            y: 0;
            width: 14
            height: 15
            color: "#ffffff"
            text: "0"
            font.family: "Swis721 BlkCn BT"
            font.pointSize: 16
            z: 1
        }


        Rectangle {
          id: ground;
          x:-67
          y:page.height-65;

          width: page.width; height: 80
          color: "#00000000";
          opacity: 1.0;
          Image {
              id: image3
              x: -7
              y: 36
              source:randomImage();//"Stone-seamless-background.png";
              width: 481
              height: 65
              anchors.rightMargin: 6
              anchors.bottomMargin: -36
              anchors.leftMargin: -7
              anchors.topMargin: 36
              fillMode: Image.Tile;
              anchors.fill: parent
              function randomImage()
              {
              var images = ["Stone-seamless-background.png", "Stone-seamless-background.png"];
              var idx = Math.floor((Math.random() * 100)) % images.length;
              return (images[idx]);
              }
          }
        }
        Rectangle {
          id: digger;
          x: 456
          y: 521
          z: 2;
          width: 50;
          height:50;
          color: "#00000000";
          focus: true;
          Keys.onLeftPressed:{ if (digger.pos.x != 0) digger.pos.x -= 5; console.log('111111');}
          Keys.onRightPressed: if (digger.pos.x !== (page.width-digger.width)) digger.pos.x += 5;
          Keys.onUpPressed: digger.pos.y -= 5;
          Keys.onDownPressed: if (digger.pos.y !== (page.height-ground.height +20- digger.height)) digger.pos.y += 5;
          onYChanged:{
              score.text=getscore(page.height - digger.y-25);
                console.log(getscore(page.height - digger.y));
              console.log (digger.pos.y);
          }

          Image {
              id: image2
              x: 0
              y: 1
              fillMode: Image.Center;
              rotation: 0;
              transformOrigin: Item.Center;
              visible: true;
              source: "me-mini.png";
          }
        }
//
        Rectangle {
            id:monster1;
            color:"#00000000";
            width:50;height:50;
            x:page.width - monster1.width
            y:page.height/2;
            Image {
                id: monster1Image;
                x: -81
                y: -173
                source: "Angry-monster1-l.png";
            }

            Rectangle {
                id: rectangle5
                x: -376
                y: -103
                width: 200
                height: 200
                color: "#ffffff"
                opacity: 0
            }
            onXChanged:{ if((digger.pos.x < monster1.pos.x+30) && (digger.pos.x > monster1.pos.x) && (digger.pos.y > monster1.pos.y-monster1.height) && (digger.pos.y < monster1.pos.y+70))
                {digger.pos.y = page.height - 90;
                     page.state="State2"
                    text8.text=getscore(page.height - digger.y);
                    page.score = 0;
                    score.text = "0";
                    digger.pos.y =550;
                    digger.pos.x =285;
                }
//
            }

            SequentialAnimation on x {

                loops: Animation.Infinite;
                NumberAnimation { to: 0; duration:3000; }
                PropertyAction { target: monster1Image; property: "source"; value: "Angry-monster1-r.png"; }
                NumberAnimation { to: page.width - 50; duration: 3000 }
                PropertyAction { target: monster1Image; property: "source"; value: "Angry-monster1-l.png"; }
            }
        }
    }

    Text {
        id: text8
        x: 187
        y: 207
        text: qsTr("text")
        font.pixelSize: 12
        opacity: 0
    }

    MouseArea {
        id: mouse_area1
        x: 0
        y: 323
        width: 480
        height: 51
        onClicked:
        {
           page.state="State3"
        }
    }
    Component {
        id: petDelegate
        Item {
            id: wrapper
            width: 200; height: 55
            Column {
                Text { text: 'Имя: ' + Name }
                Text { text: 'Счет: ' + account }
                            }
            // indent the item if it is the current item
            states: State {
                name: "Current"
                when: wrapper.ListView.isCurrentItem
                PropertyChanges { target: wrapper; x: 20 }
            }
            transitions: Transition {
                NumberAnimation { properties: "x"; duration: 200;}
            }
        }
    }

    // Define a highlight with customised movement between items.

    ListView {
        id: list_view1
        x: 36
        y: 418
        width: 110
        height: 160
        model: ListModel {
            id: listModel
        }
        delegate: petDelegate
        focus: true

        // Set the highlight delegate. Note we must also set highlightFollowsCurrentItem
        // to false so the highlight delegate can control how the highlight is moved.
        highlight: highlightBar
        highlightFollowsCurrentItem: false

        Component.onCompleted: {
            var db = openDatabaseSync("save.sdb", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM students');
                            for(var i = 0; i < rs.rows.length; i++) {
                                var data = {'Name':rs.rows.item(i).Name, 'account': rs.rows.item(i).account};
                                listModel.append(data)

                            }
                            listModel.sync()
                        }
                        )
        }
        opacity: 0
    }


    states: [
        State {
            name: "State1"

           PropertyChanges {
                target: rectangle1
                x: -171
                y: -5
                width: 159
                height: 250
                opacity: 1
            }

            PropertyChanges {
                target: image1
                x: 0
                y: 31
                width: 480
                height: 609
                fillMode: "Tile"
                opacity: 1
            }

            PropertyChanges {
                target: stats_block
                x: 0
                y: 1
                width: 480
                height: 30
                color: "#271f1f"
            }


            PropertyChanges {
                target: name
                x: 6
                y: 3
            }

            PropertyChanges {
                target: image2
                x: 0
                y: 0
                height: 50
                visible: true
            }

//            PropertyChanges {
//                target: image3
//                x: 0
//                y: 0
//                width: 480
//                height: 80
//                anchors.topMargin: 0
//                anchors.rightMargin: 0
//                anchors.bottomMargin: 0
//                anchors.leftMargin: 0
//            }


            PropertyChanges {
                target: monster1Image
                x: 0
                y: 0
                width: 50
                height: 83
            }

            PropertyChanges {
                target: monster1
                width: 50
                height: 83
            }

            PropertyChanges {
                target: digger
                x: 207
                y: 525
            }

            PropertyChanges {
                target: image3
                x: 0
                y: -17
                anchors.topMargin: -17
                anchors.rightMargin: -1
                anchors.bottomMargin: 17
                anchors.leftMargin: 0
            }

            PropertyChanges {
                target: ground
                x: 0
            }

            PropertyChanges {
                target: score
                width: 14
                height: 80
            }

//            PropertyChanges {
//                target: ground
//                x: 0
//                height: 65
//            }

        },
        State {
            name: "State2"
            PropertyChanges {
                target: rectangle1
                x: 0
                y: 0
                width: 480
                height: 720
                color: "#3a2b24"
                opacity: "1"
            }

            PropertyChanges {
                target: image1
                x: "0"
                y: 0
                width: "480"
                height: 720
                fillMode: "Tile"
                opacity: "1"
            }

            PropertyChanges {
                target: text6
                x: 0
                y: 76
                width: 480
                height: 68
                color: "#ffffff"
                text: qsTr("Scores:")
                font.family: "Comic Sans MS"
                horizontalAlignment: "AlignHCenter"
                font.pixelSize: 50
                opacity: 1
            }

            PropertyChanges {
                target: text7
                x: 0
                y: 252
                width: 480
                height: 71
                color: "#ffffff"
                text: qsTr("Name:")
                horizontalAlignment: "AlignHCenter"
                font.family: "Comic Sans MS"
                font.pixelSize: 50
                opacity: 1
            }

            PropertyChanges {
                target: text_input1
                x: 94
                y: 358
                width: 293
                height: 61
                color: "#2d2929"
                text: qsTr("")
                font.bold: true
                selectedTextColor: "#ffffff"
                echoMode: "Normal"
                selectionColor: "#f6fbfb"
                font.italic: false
                horizontalAlignment: "AlignHCenter"
                font.pixelSize: 44
                font.family: "Comic Sans MS"
                cursorVisible: true
                opacity: 1
            }

            PropertyChanges {
                target: rectangle2
                x: 94
                y: 358
                width: 293
                height: 61
                color: "#a08787"
                opacity: 1
            }

            PropertyChanges {
                target: rectangle3
                x: 17
                y: 454
                width: 220
                height: 90
                color: "#8b5452"
                opacity: 1
            }

            PropertyChanges {
                target: rectangle4
                x: 253
                y: 454
                width: 212
                height: 90
                color: "#8b5452"
                opacity: 1
            }

            PropertyChanges {
                target: buttonLabel
                width: 163
                height: 51
                color: "#ddc4c4"
            }

            PropertyChanges {
                target: buttonLabel2
                x: 17
                y: 22
                width: 178
                height: 51
                color: "#ddc4c4"
            }

            PropertyChanges {
                target: monster1Image
                x: -25
                y: -410
            }

            PropertyChanges {
                target: ground
                x: -53
            }

            PropertyChanges {
                target: image3
                x: -31
                y: 41
                width: 511
                height: 87
                anchors.topMargin: 41
                anchors.rightMargin: 0
                anchors.bottomMargin: -67
                anchors.leftMargin: -31
            }

            PropertyChanges {
                target: buttonMouseArea2
                x: 0
                y: -6
                width: 220
                height: 96
                anchors.topMargin: -6
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
            }

            PropertyChanges {
                target: rectangle5
                x: 94
                y: 168
                width: 293
                height: 61
                color: "#a08787"
                opacity: 1
            }

            PropertyChanges {
                target: text_input2
                opacity: 1
            }

            PropertyChanges {
                target: text8
                x: 94
                y: 168
                width: 293
                height: 61
                color: "#2d2929"
                text: jbhjk
                font.family: "Comic Sans MS"
                font.italic: false
                font.bold: true
                font.pixelSize: 40
                verticalAlignment: "AlignVCenter"
                horizontalAlignment: "AlignHCenter"
                opacity: 1
            }
        },
        State {
            name: "State3"

            PropertyChanges {
                target: mousearea1
                x: 561
                y: 34
                anchors.topMargin: 34
                anchors.rightMargin: -561
                anchors.bottomMargin: -34
                anchors.leftMargin: 561
            }

            PropertyChanges {
                target: text2
                x: 524
                y: 189
            }

            PropertyChanges {
                target: monster1Image
                x: 69
                y: -393
            }

            PropertyChanges {
                target: mouse_area1
                x: 622
                y: 265
            }

            PropertyChanges {
                target: text3
                x: -5
                y: 125
                text: "Scores"
            }

            PropertyChanges {
                target: text4
                x: 631
                y: 414
            }

            PropertyChanges {
                target: ground
                x: 616
            }

            PropertyChanges {
                target: image3
                x: 24
                y: 190
                anchors.topMargin: 190
                anchors.rightMargin: -25
                anchors.bottomMargin: -190
                anchors.leftMargin: 24
            }

            PropertyChanges {
                target: list_view1
                x: 17
                y: 189
                width: 434
                height: 317
                opacity: 1
            }

            PropertyChanges {
                target: page
                color: "#3a2b24"
            }
        }
    ]
}

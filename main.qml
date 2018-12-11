import QtQuick 2.6
import QtQuick.Window 2.2
import ck.gmachine 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Canvas Learn")
   Canvas {
        id: a
        anchors.fill: parent
        onPaint: {
        }
    }
    Canvas {
        id: b
        anchors.fill: parent
        onPaint: {
            if(GSystem.aniInited === false)
            {
                if(!GSystem.isContextReady(a,this))
                {
                    this.requestPaint();
                    return;
                }
                GSystem.initAnim(a,this);
                this.requestPaint();
                return;

            }
            GSystem.drawAnim();
        }
        Component.onCompleted: {
            console.log("b completed : "+b.getContext("2d"));
        }
    }
}

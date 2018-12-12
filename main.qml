import QtQuick 2.6
import QtQuick.Window 2.2
import ck.gmachine 1.0
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Canvas Learn")
    Image{
        id:bg
        source:"qrc:/imagesources/background.png"
        visible: true
    }
    Image{
        id:bg_alpha
        source:"qrc:/imagesources/background_alpha.png"
        visible: false
        opacity: 0.1
    }
   Canvas {
        id: a
        anchors.fill: parent
        onPaint: {
        }
        onAvailableChanged:{
        }
        onImageLoaded: {

        }
    }
    Canvas {
        id: b
        anchors.fill: parent
        onAvailableChanged: {
            if(available==true && a.available)
            {
                GSystem.initAnim(a,this,bg,bg_alpha);
            }
        }
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
    GaussianBlur{
    anchors.fill: b
    source: b
    radius:3
    samples: 16
    deviation:1
   }
}

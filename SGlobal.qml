pragma Singleton
import QtQuick 2.0
import "scripts/mainfuncs.js" as MainMdl
import "scripts/simplex-noise.js" as SimplexMdl
import "scripts/ether.js" as Ether

Item {
    id:root
    property bool aniInited : false;

    function initAnim(a,b,bg,bga)
    {
        Ether.setup(a,b,bg,bga);
        aniInited = true;
    }

    function isContextReady(a,b)
    {
        var acon = a.getContext("2d");
        var bcon = b.getContext("2d");
        if(acon && bcon)
        {
            return true;
        }
        return false;
    }
    function drawAnim()
    {
        Ether.draw();
    }

    function randRect(item)
    {
            var ctx = item.getContext("2d");
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
            ctx.clearRect(0,0,item.width,item.height);
            ctx.fillRect( (Math.random() * 1000) % item.width, (Math.random() * 1000) % item.height, 100, 100);
            item.requestAnimationFrame(item.requestPaint);
    }
}


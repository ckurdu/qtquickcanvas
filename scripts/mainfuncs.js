var MainMdl;
var comps = {};
var pageMap = {};

function createComponent(name)
{
    comps[name] = Qt.createComponent(name+".qml");
}

function addPage(name,item)
{
    pageMap[name] = item;
}
function getPage(name)
{
    return pageMap[name];
}

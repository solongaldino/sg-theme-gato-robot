
var tags = ['a', 'img', 'script', 'link'];

var listHtml = '';

var arrayLinks = [];

function addItemListHtml(item) {

  if(arrayLinks.indexOf(item) == -1){
    arrayLinks.push(item);
    listHtml+=item+'<br>';
  }
}

function getListByTagName(tagName) {

  var anchors = document.getElementsByTagName(tagName);

  for(var i=0; i < anchors.length; i++){

    if(tagName == 'a'){

      if(!!anchors[i].href && window.location.href+'#' != anchors[i].href){

        if(anchors[i].href.indexOf(window.location.hostname) != -1){
          addItemListHtml(anchors[i].href);
        }
      }

    }else if (tagName == 'img') {

      if(!!anchors[i].src){
        addItemListHtml(anchors[i].src);
      }

    }else if (tagName == 'script') {

      if(!!anchors[i].src){
        addItemListHtml(anchors[i].src);
      }

    }else if (tagName == 'link') {

      if(!!anchors[i].href){
        addItemListHtml(anchors[i].href);
      }

    }else {
      console.log("tagName not found");
    }
  }
}

for (var i = 0; i < tags.length; i++) {
  getListByTagName(tags[i]);
}

window.document.write(listHtml);

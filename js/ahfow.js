window.addEventListener("DOMContentLoaded", function externalLinks() {
  var anchors = document.getElementsByTagName("a");
  for (var i = 0; i < anchors.length; i++) {
    if (anchors[i].hostname !== window.location.hostname) {
      anchors[i].setAttribute("target", "_blank");
      anchors[i].setAttribute("rel", "noopener");
    }
  }
});

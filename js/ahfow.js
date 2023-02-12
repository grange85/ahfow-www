window.addEventListener("DOMContentLoaded", function externalLinks() {
  var anchors = document.getElementsByTagName("a");
  for (var i = 0; i < anchors.length; i++) {
    if (anchors[i].hostname !== window.location.hostname) {
      anchors[i].setAttribute("target", "_blank");
      anchors[i].setAttribute("rel", "noopener");
    }
  }
});


window.addEventListener("DOMContentLoaded", function imageClasses() {
  var images = document.querySelectorAll('article.post-content img');
  for (var i = 0; i < images.length; i++) {
	images[i].classList.add("w-100");
  }
});

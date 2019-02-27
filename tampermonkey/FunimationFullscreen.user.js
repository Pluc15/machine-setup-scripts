// ==UserScript==
// @name         Funimation Fullscreen
// @namespace    https://github.com/Pluc15
// @author       Pluc
// @match        *://www.funimation.com/shows/*/*/*/?*marathon=true
// @grant        none
// ==/UserScript==
(function() {
  console.log("= Funimation Fullscreen Loaded =");
  function setFullscreen() {
    var player = document.getElementById("player");

    if (player) {
      var body = document.querySelector("body");
      body.style.overflow = "hidden";

      player.style.position = "absolute";
      player.style.top = 0;
      player.style.right = 0;
      player.style.bottom = 0;
      player.style.left = 0;
      player.style.zIndex = 999998;
      player.parentElement.removeChild(player);
      body.appendChild(player);
    } else {
      console.log("Video frame not found, trying again in 500ms");
      setTimeout(setFullscreen, 500);
    }
  }

  setFullscreen();
})();

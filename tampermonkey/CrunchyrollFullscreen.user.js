// ==UserScript==
// @name         Crunchyroll Fullscreen
// @namespace    https://github.com/Pluc15
// @author       Pluc
// @match        *://www.crunchyroll.com/*/*
// @grant        none
// ==/UserScript==
(function() {
  console.log("= Crunchyroll Fullscreen Loaded =");
  function setFullscreen() {
    var player = document.getElementById("vilos-player");

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

      var controls = document.createElement("div");
      controls.style.position = "absolute";
      controls.style.bottom = 0;
      controls.style.left = "40%";
      controls.style.right = "40%";
      controls.style.backgroundColor = "black";
      controls.style.fontSize = "20px";
      controls.style.fontWeight = "bold";
      controls.style.zIndex = 999999;
      body.appendChild(controls);

      var oldPrev = document.querySelector(
        ".collection-carousel-media-link-current"
      ).parentElement.previousElementSibling;
      var prevUrl = oldPrev ? oldPrev.querySelector("a").href : null;

      if (prevUrl) {
        var prev = document.createElement("a");
        prev.style.position = "relative";
        prev.style.bottom = 0;
        prev.style.left = 0;
        prev.style.color = "white";
        prev.href = prevUrl;
        prev.textContent = "<<";
        controls.appendChild(prev);
      }

      var oldNext = document.querySelector(
        ".collection-carousel-media-link-current"
      ).parentElement.nextElementSibling;
      var nextUrl = oldNext ? oldNext.querySelector("a").href : null;

      if (nextUrl) {
        var next = document.createElement("a");
        next.style.position = "relative";
        next.style.bottom = 0;
        next.style.right = 0;
        next.style.color = "white";
        next.href = nextUrl;
        next.textContent = ">>";
        controls.appendChild(next);
      }
    } else {
      console.log("Video frame not found, trying again in 500ms");
      setTimeout(setFullscreen, 500);
    }
  }

  setFullscreen();
})();

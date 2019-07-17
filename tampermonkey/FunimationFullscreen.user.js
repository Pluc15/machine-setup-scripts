// ==UserScript==
// @name         Funimation Fullscreen
// @namespace    https://github.com/Pluc15
// @author       Pluc
// @match        *://www.funimation.com/shows/*/*/*
// @grant        none
// ==/UserScript==
(async function() {
  var css = document.createElement('style');
  css.type = 'text/css';
  css.innerHTML = `
::-webkit-scrollbar {
  display: none;
}
header {
  position: initial !important;
}
#main {
  margin-top: 0 !important;
}
#main,
section.video-player-section,
section.video-player-section > .container,
section.video-player-section > .container > .row,
section.video-player-section > .container > .row > .video-player-container
{
  min-height: unset !important;
  max-height: unset !important;
  height: unset !important;
  max-width: 100% !important;
  width: 100% !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}
#player {
  height: 100vh !important;
}`;
  document.head.appendChild(css);
  await new Promise(resolve => setTimeout(resolve, 2000));
  document.getElementById("player").scrollIntoView(true);
})();
// ==UserScript==
// @name         Crunchyroll Fullscreen
// @namespace    https://github.com/Pluc15
// @author       Pluc
// @match        *://www.crunchyroll.com/*/*
// @grant        none
// ==/UserScript==
(async function() {
  var css = document.createElement('style');
  css.type = 'text/css';
  css.innerHTML = `
::-webkit-scrollbar {
  display: none;
}
#template_container,
#showmedia_video_box_wide {
  min-height: unset !important;
  max-height: unset !important;
  height: unset !important;
  width: 100% !important;
  max-width: 100% !important;
  padding-left: 0 !important;
  padding-right: 0 !important;
  margin-left: 0 !important;
  margin-right: 0 !important;
}
#showmedia_video_box_wide {
  height: 100vh !important;
}
#main_content {
  width: 70% !important;
}
#sidebar {
  width: 30% !important;
}`;
  document.head.appendChild(css);
  await new Promise(resolve => setTimeout(resolve, 500));
  document.getElementById("showmedia_video").scrollIntoView(true);
})();

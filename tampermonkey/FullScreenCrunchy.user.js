// ==UserScript==
// @name         FullScreenCrunchy
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http://www.crunchyroll.com/*
// @grant        none
// ==/UserScript==

(function($) {
    'use strict';
    $("body").append(`<style>
#showmedia_video_player {
    visibility: hidden;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: 100%;
    z-index: 99999;
}
<style>`);
})(jQuery);
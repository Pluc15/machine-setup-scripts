// ==UserScript==
// @name         Full Screen Anime Heaven
// @namespace    http://tampermonkey.net/
// @version      0.2
// @description  Full screen UI for Anime Heaven with a tiny overlay for previous and next
// @author       Pluc
// @match        http://animeheaven.eu/watch.php*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var tmPrevOld = document.querySelector("a[rel=prev]");
    var tmPrevUrl = tmPrevOld ? tmPrevOld.href : null;
    var tmNextOld = document.querySelector("a[rel=next]");
    var tmNextUrl = tmNextOld ? tmNextOld.href : null;

    var tmBody = document.getElementsByTagName("body")[0];
    tmBody.setAttribute("style", "overflow: hidden");

    var tmNewContainer = document.createElement("div");
    tmNewContainer.setAttribute("style", "position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color: black; display: table-cell; vertical-align: middle; z-index: 999999");
    tmNewContainer.setAttribute("class", "tmah");
    tmBody.append(tmNewContainer);

    var tmControls = document.getElementById("controls");
    tmControls.setAttribute("style", "position: absolute; bottom: 0; left: 30px; right: 30px; color: white; background-color: black; z-index: 999997");
    tmNewContainer.appendChild(tmControls);

    var tmVideo = document.getElementById("videocon");
    tmVideo.setAttribute("id", "");
    tmVideo.setAttribute("class", "tmah");
    tmVideo.setAttribute("style", "z-index: 999996");
    tmNewContainer.appendChild(tmVideo);

    if (tmPrevUrl) {
        var tmPrev = document.createElement("a");
        tmPrev.setAttribute("style", "position: absolute; bottom: 0; left: 0; color: white; background-color: black; z-index: 999997");
        tmPrev.setAttribute("href", tmPrevUrl);
        tmPrev.setAttribute("class", "tmah");
        tmPrev.textContent = "<<";
        tmNewContainer.appendChild(tmPrev);
    }

    if (tmNextUrl) {
        var tmNext = document.createElement("a");
        tmNext.setAttribute("style", "position: absolute; bottom: 0; right: 0; color: white; background-color: black; z-index: 999997");
        tmNext.setAttribute("href", tmNextUrl);
        tmNext.setAttribute("class", "tmah");
        tmNext.textContent = ">>";
        tmNewContainer.appendChild(tmNext);
    }

    setTimeout(function() {
        document.querySelectorAll("iframe").forEach(function(tmEle){
            tmEle.remove();
        });
    }, 2000);
})();
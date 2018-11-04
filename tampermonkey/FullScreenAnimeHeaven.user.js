// ==UserScript==
// @name         Full Screen Anime Heaven
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Full screen UI for Anime Heaven with a tiny overlay for previous and next
// @author       Pluc
// @match        http://animeheaven.eu/watch.php*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    var i;
    var tmPrevUrl = document.querySelector("a[rel=prev]").href;
    var tmNextUrl = document.querySelector("a[rel=next]").href;

    var tmBody = document.getElementsByTagName("body")[0];
    tmBody.setAttribute("style", "overflow: hidden");

    var tmNewContainer = document.createElement("div");
    tmNewContainer.setAttribute("style", "position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color: black; display: table-cell; vertical-align: middle; z-index: 999999;");
    tmNewContainer.setAttribute("class", "tmah");
    tmBody.append(tmNewContainer);

    var tmControls = document.querySelector(".con");
    tmControls.setAttribute("style", "position: absolute; bottom: 0; left: 30px; right: 30px; color: white; background-color: black");
    tmNewContainer.appendChild(tmControls);

    var tmVideo = document.getElementById("videocon");
    tmVideo.setAttribute("id", "");
    tmVideo.setAttribute("class", "tmah");
    tmNewContainer.appendChild(tmVideo);

    var tmPrev = document.createElement("a");
    tmPrev.setAttribute("style", "position: absolute; bottom: 0; left: 0; color: white; background-color: black");
    tmPrev.setAttribute("href", tmPrevUrl);
    tmPrev.setAttribute("class", "tmah");
    tmPrev.textContent = "<<";
    tmNewContainer.appendChild(tmPrev);

    var tmNext = document.createElement("a");
    tmNext.setAttribute("style", "position: absolute; bottom: 0; right: 0; color: white; background-color: black");
    tmNext.setAttribute("href", tmNextUrl);
    tmNext.setAttribute("class", "tmah");
    tmNext.textContent = ">>";
    tmNewContainer.appendChild(tmNext);


    setTimeout(function() {
        document.querySelectorAll("iframe").forEach(function(tmEle){
            tmEle.remove();
        });
    }, 5000);
})();
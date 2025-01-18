// ==UserScript==
// @name         Canvas Redirect
// @namespace    http://tampermonkey.net/
// @version      2025-01-16
// @description  try to take over the world!
// @author       You
// @match        https://www.canvas.gatech.edu/
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    
    // Skip the login page, go straight to canvas
    location.href = "https://gatech.instructure.com/"
})();

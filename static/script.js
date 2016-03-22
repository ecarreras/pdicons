function iconLoadListener() {
    var icons = document.querySelectorAll(".icon__preview");

    Array.prototype.forEach.call(icons, function(icon, i) {
        icon.src += "#" + Date.now().toString();

        icon.onload = function() {
            this.parentNode.parentNode.className = "icon__loaded";
        };
    });
}

document.addEventListener("DOMContentLoaded", function() {
    iconLoadListener();
}, false);

var form = document.querySelector(".search-form");

if (form.addEventListener) {
    form.addEventListener("submit", iconLoadListener, false);
}

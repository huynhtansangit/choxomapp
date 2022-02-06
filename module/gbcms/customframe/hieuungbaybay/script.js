window.addEventListener('DOMContentLoaded', (event) => {
    $('[data-split-text="lines"]').lettering("lines").children("span").text(function (e, t) {
        return t.trim()
    }).lettering("words").children("span").lettering().children("span"), document.querySelectorAll('[class^="line"]').forEach(function (e) {
        var i = getComputedStyle(e).getPropertyValue("--delay"), n = e.querySelectorAll('[class^="char"]');
        n.forEach(function (e, t) {
            e.style.setProperty("--delay", "".concat(parseFloat(i) + t / Math.max(2 * n.length, 20), "s")), e.style.setProperty("--duration", "".concat(.5, "s"))
        })
    }), document.querySelectorAll('[data-animation="stagger-list"]').forEach(function (e) {
        var i = getComputedStyle(e).getPropertyValue("--delay");
        e.querySelectorAll('[data-animation="stagger-item"]').forEach(function (e, t) {
            e.style.setProperty("--delay", "".concat(parseFloat(i) + t / 10, "s"))
        })
    });
});

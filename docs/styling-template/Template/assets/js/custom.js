
$(document).ready(function () {
  "use strict"; //
  //add images with data attributes

  (function ($) {
    if ("objectFit" in document.documentElement.style === false) {
      $(".bg-image").each(function attachBg() {
        var img = $(this);
        var src = img.attr("src");
        var classes = img.get(0).classList;
        img.before($("<div class=\"" + classes + "\" style=\"background: url(" + src + "); background-size: cover; background-position: 50% 50%;\"></div>"));
        img.remove();
      });
    }
  })(jQuery); //
  // Home Swiper Slider -Fullscreen


  var swiper = new Swiper(".swiper-container", {
    pagination: {
      el: ".swiper-pagination",
      dynamicBullets: true
    }
  }); //
  // add class active to the section-nav - used oon documentation page and faq page

  $(".section-nav li a").on("click", function () {
    $("li a").removeClass("active");
    $(this).addClass("active");
  });
}); // Anchor link scrolling,use by adding "data-scroll"

document.addEventListener("DOMContentLoaded", function () {
  var root = function () {
    if ("scrollingElement" in document) return document.scrollingElement;
    var start = document.documentElement.scrollTop;
    document.documentElement.scrollTop = start + 1;
    var end = document.documentElement.scrollTop;
    document.documentElement.scrollTop = start;
    return end > start ? document.documentElement : document.body;
  }();

  var ease = function ease(duration, elapsed, start, end) {
    return Math.round(end * (-Math.pow(2, -10 * elapsed / duration) + 1) + start);
  };

  var hash = function hash(link) {
    return link.getAttribute("href");
  };

  var target = function target(link) {
    return document.querySelector(hash(link));
  };

  var getCoordinates = function getCoordinates(link) {
    var start = root.scrollTop;
    var top = Math.round(target(link).getBoundingClientRect().top);
    var max = root.scrollHeight - window.innerHeight;
    var end = start + top < max ? top : max - start;
    return new Map([["start", start], ["end", end]]);
  };

  var scroll = function scroll(link) {
    var progress = new Map([["duration", 850]]);
    var coordinates = getCoordinates(link);

    var tick = function tick(timestamp) {
      progress.set("elapsed", timestamp - start);
      root.scrollTop = ease.apply(undefined, _toConsumableArray(progress.values()).concat(_toConsumableArray(coordinates.values())));
      progress.get("elapsed") < progress.get("duration") ? requestAnimationFrame(tick) : history.pushState(null, null, hash(link));
    };

    var start = performance.now();
    requestAnimationFrame(tick);
  };

  Array.from(document.querySelectorAll("[data-scroll]")).forEach(function (link) {
    return link.addEventListener("click", function (event) {
      event.preventDefault();
      scroll(link);
    });
  });
});
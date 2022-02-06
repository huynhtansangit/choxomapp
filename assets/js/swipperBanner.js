const swiper = new Swiper("#homepage_swiper", {
  spaceBetween: 0,
  slidesPerView: 1,
  effect: "slide",
  parallax: true,
  loop:false,
  centeredSlides: true,
   //autoplay: {
   //  delay: 3000,
   //  disableOnInteraction: false,
   //},
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  pagination: {
    el: ".homepage__pagination",
    clickable: false,
  },
   //mousewheel: {
   //  releaseOnEdges: true,
   //},
});
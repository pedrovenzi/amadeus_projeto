// $('.navbar a').on('click', function(e) {
//     if (this.hash !== '') {
//         e.preventDefault();
//
//         const hash = this.hash;
//
//         $('html,body').animate(
//             {
//                 scrollTop: $(hash).offset().top
//             },
//             800
//         );
//     }
// });


https://cdn.jsdelivr.net/gh/cferdinandi/smooth-scroll@15.0.0/dist/smooth-scroll.polyfills.min.js"

var scroll = new SmoothScroll('a[href*="#"]', {
    speed: 800
});
</script>
// var slideIndex = 0;
// showSlides();

// function showSlides() {
//     var i;
//     var slides = document.getElementsByClassName("mySlides");
//     var bullets = document.getElementsByClassName("bullet");
//     console.log("debug");
//     for (i = 0; i < slides.length; i++) {
//         slides[i].style.display = "none";  
//     }
//     slideIndex++;
//     if (slideIndex > slides.length) {slideIndex = 1}    
//     for (i = 0; i < bullets.length; i++) {
//         bullets[i].className = bullets[i].className.replace(" active", "");
//     }
//     slides[slideIndex-1].style.display = "block";  
//     bullets[slideIndex-1].className += " active";
//     setTimeout(showSlides, 2000); // 2000 Millisekunden zwischen den Bidlerwechseln
// }

var slideIndex = 1;

showSlides(slideIndex);

function toggleAutorun() {
    const cb = document.getElementById('autorun').checked;
    if (cb == true) {
        plusSlides(1);
        setTimeout(toggleAutorun, 3000);
    }
}

function plusSlides(n) {
    showSlides(slideIndex += n);
}

function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var bullets = document.getElementsByClassName("bullet");
    if (n > slides.length) {slideIndex = 1}    
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
    }
    for (i = 0; i < bullets.length; i++) {
        bullets[i].className = bullets[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    bullets[slideIndex-1].className += " active";
}
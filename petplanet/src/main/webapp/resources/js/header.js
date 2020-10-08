const toggleBtn = document.querySelector(".navbar_toggleBtn");
const menu = document.querySelector(".navbar_menu");
const icons = document.querySelector(".navbar_icons");

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    icons.classList.toggle('active');
});

window.addEventListener('scroll', function(){
    const logoImage = document.querySelector('.navbar_logo img');
    const navbar = document.getElementById('navbar');

    if(window.pageYOffset > 0) {
        logoImage.style.height = "44px";
        navbar.classList.add('bg-black');
        navbar.classList.add('txt-white');

    } else {
        logoImage.style.height = "64px";
        navbar.classList.remove('bg-black');
        navbar.classList.remove('txt-white');
    }
});
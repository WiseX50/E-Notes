const profile = document.querySelector('.prf');
const password = document.querySelector('.psw');

let popupProfile = document.querySelector('.profile');
let popupPassword = document.querySelector('.password');

function openProfile() {
    popupProfile.classList.add('activ');
    popupPassword.classList.remove('popup');
}

function openPassword() {
    popupPassword.classList.add('popup');
    popupProfile.classList.remove('activ');
}

profile.addEventListener('click', openProfile);
password.addEventListener('click', openPassword);
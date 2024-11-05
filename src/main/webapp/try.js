const trigger = document.querySelector('.addNote');
const mainBlur = document.querySelector('.main');
const editBtn = document.querySelector('.editBtn');

let popUp = document.querySelector('.Popup-container');
let editNoteCnt = document.querySelector('.edit')
let overlay = document.querySelector('.overlay');
let closeBtn = document.querySelector('.close');
let closeEdt = document.querySelector('.closeEdt');

function openPopup() {
    popUp.classList.add('act');
    mainBlur.classList.add('blr');
}
function closePopup() {
    popUp.classList.remove('act');
    mainBlur.classList.remove('blr');
}
function openEditNote() {
    editNoteCnt.classList.add('frnt');
    mainBlur.classList.add('blr');
}
function closeEditNote() {
    editNoteCnt.classList.remove('frnt');
    mainBlur.classList.remove('blr');
}
trigger.addEventListener('click', openPopup);
closeBtn.addEventListener('click', closePopup);




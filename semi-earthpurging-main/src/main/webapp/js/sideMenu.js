

const currURL = document.URL;
const splitURL = currURL.split("/");

const sideMenuList = document.querySelectorAll(".side-menu a");
sideMenuList.forEach(function(item, index) {
    item.parentElement.classList.remove("active");
    if(item.getAttribute("href").indexOf(splitURL[splitURL.length-1])==1) {
        item.parentElement.classList.add("active");
    }

})